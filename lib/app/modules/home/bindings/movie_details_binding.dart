import 'package:flutter_getx_template/app/modules/home/controllers/movie_details_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(
          () => MovieDetailsController(),
    );
  }
}