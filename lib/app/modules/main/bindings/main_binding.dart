import 'package:get/get.dart';

import '../../login/controlllers/login_controller.dart';
import '/app/modules/home/viewModel/home_view_model.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () => LoginController(),
      fenix: true,
    );
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(),
      fenix: true,
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
