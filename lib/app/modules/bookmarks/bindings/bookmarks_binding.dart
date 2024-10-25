import 'package:get/get.dart';

import '/app/modules/bookmarks/controllers/bookmarks_controller.dart';

class BookmarksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarksController>(
      () => BookmarksController(),
    );
  }
}
