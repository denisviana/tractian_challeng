import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/pages/widgets/asset_tree_widget.dart';
import 'controller/asset_controller.dart';

class AssetPage extends GetView<AssetController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Assets'),
        ),
        body: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                onChanged: controller.onSearchQueryChanged,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Asset or Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            // Dropdown for selecting location
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Obx(
                () => DropdownButton<String>(
                  value: controller.selectedLocation.value.isEmpty
                      ? null
                      : controller.selectedLocation.value,
                  hint: const Text('Select Location'),
                  dropdownColor: Colors.white,
                  onChanged: (newValue) {
                    controller.selectedLocation.value = newValue ?? '';
                    controller.applyFilters();
                  },
                  items: controller.locations
                      .map(
                        (location) => DropdownMenuItem<String>(
                          value: location.id,
                          child: Text(location.name),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            // Filter buttons for Energy Sensor and Critical Status
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Obx(() => ElevatedButton(
                        onPressed: () {
                          controller.filterEnergySensor.value =
                              !controller.filterEnergySensor.value;
                          controller.applyFilters();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.filterEnergySensor.value
                              ? Colors.blue
                              : Colors.grey[200],
                        ),
                        child: Text(
                          'Energy Sensor',
                          style: TextStyle(
                            color: controller.filterEnergySensor.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      )),
                  const SizedBox(width: 8),
                  Obx(() => ElevatedButton(
                        onPressed: () {
                          controller.filterCritical.value =
                              !controller.filterCritical.value;
                          controller.applyFilters();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.filterCritical.value
                              ? Colors.blue
                              : Colors.grey[200],
                        ),
                        child: Text(
                          'Critical Status',
                          style: TextStyle(
                            color: controller.filterCritical.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            // Tree View
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.errorMessage.isNotEmpty) {
                  return Center(child: Text(controller.errorMessage.value));
                }
                if (controller.filteredAssets.isEmpty) {
                  return const Center(child: Text('No matching assets found'));
                }
                return AssetTreeWidget(
                  locations: controller.locations,
                  assets: controller.filteredAssets,
                );
              }),
            ),
          ],
        ),
      );
}
