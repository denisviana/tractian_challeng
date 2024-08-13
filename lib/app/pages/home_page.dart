import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/pages/asset_page.dart';
import 'package:my_app/app/pages/controller/home_controller.dart';
import 'package:my_app/app/pages/widgets/company_card.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'images/tractian_logo.png',
            height: 30,
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Text(controller.errorMessage.value,
                  style: const TextStyle(color: Colors.red)),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            itemCount: controller.companies.length,
            itemBuilder: (context, index) {
              final company = controller.companies[index];
              return CompanyCard(
                company: company,
                onTap: () {
                  Get.to(() => AssetPage(), arguments: company.id);
                },
              );
            },
          );
        }),
      );
}
