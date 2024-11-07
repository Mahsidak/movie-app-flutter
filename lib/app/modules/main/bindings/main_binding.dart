import 'package:flutter_getx_template/app/modules/search/controllers/search_controller.dart';
import 'package:get/get.dart';

import '../../login/controlllers/login_controller.dart';
import '/app/modules/bookmarks/controllers/bookmarks_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';
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
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<SearchPageController>(
          () => SearchPageController(),
    );
    Get.lazyPut<BookmarksController>(
      () => BookmarksController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
