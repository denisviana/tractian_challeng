import 'dart:async';
import 'package:get/get.dart';
import 'package:my_app/core/data/model/app_exception.dart';
import '../../../core/domain/entity/asset_entity.dart';
import '../../../core/domain/entity/location_entity.dart';
import '../../../core/domain/use_case/get_assets_usecase.dart';
import '../../../core/domain/use_case/get_locations_use_case.dart';

class AssetController extends GetxController {
  final GetLocationsUseCase _getLocationsUseCase;
  final GetAssetsUseCase _getAssetsUseCase;

  String companyId = '';

  final locations = <LocationEntity>[].obs;
  final assets = <AssetEntity>[].obs;
  final filteredAssets = <AssetEntity>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final searchQuery = ''.obs;
  final filterEnergySensor = false.obs;
  final filterCritical = false.obs;
  final selectedLocation = ''.obs;

  AssetController(this._getAssetsUseCase, this._getLocationsUseCase);

  Timer? _debounce;

  void onSearchQueryChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      searchQuery.value = query;
      applyFilters();
    });
  }

  @override
  void onInit() {
    super.onInit();
    companyId = Get.arguments;
    fetchAssetsAndLocations();
  }

  Future<void> fetchAssetsAndLocations() async {
    isLoading(true);
    errorMessage('');
    try {
      final fetchedLocations = await _getLocationsUseCase(companyId);
      final fetchedAssets = await _getAssetsUseCase(companyId);

      locations.value = fetchedLocations.data ?? [];
      assets.value = fetchedAssets.data ?? [];

      applyFilters();
    } on AppException {
      errorMessage('Failed to load assets and locations');
    } finally {
      isLoading(false);
    }
  }

  void applyFilters() {
    var tempFilteredAssets = List<AssetEntity>.from(assets);

    if (searchQuery.isNotEmpty) {
      final query = searchQuery.value.toLowerCase();
      tempFilteredAssets = tempFilteredAssets
          .where((asset) => asset.name.toLowerCase().contains(query))
          .toList();
    }

    if (selectedLocation.isNotEmpty) {
      tempFilteredAssets = tempFilteredAssets
          .where((asset) => asset.locationId == selectedLocation.value)
          .toList();
    }

    if (filterEnergySensor.value) {
      tempFilteredAssets = tempFilteredAssets
          .where((asset) => asset.sensorType == 'energy')
          .toList();
    }

    if (filterCritical.value) {
      tempFilteredAssets =
          tempFilteredAssets.where((asset) => asset.status == 'alert').toList();
    }

    filteredAssets.value = tempFilteredAssets;
  }

  void toggleEnergySensorFilter() {
    filterEnergySensor.value = !filterEnergySensor.value;
    applyFilters();
  }

  void toggleCriticalFilter() {
    filterCritical.value = !filterCritical.value;
    applyFilters();
  }
}
