import 'package:get/get.dart';
import 'package:my_app/app/pages/controller/asset_controller.dart';
import 'package:my_app/app/pages/controller/home_controller.dart';
import 'package:my_app/di/di.dart';

import 'app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(
      () => AppController(),
    );
    Get.lazyPut(
      () => HomeController(
        getIt(),
      ),
    );
    Get.lazyPut(
      () => AssetController(
        getIt(),
        getIt(),
      ),
      fenix: true,
    );
  }
}
