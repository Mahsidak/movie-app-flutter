import 'package:flutter_getx_template/app/modules/home/viewModel/movie_details_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data/model/movie_list_response.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsViewModel>(
          () => MovieDetailsViewModel(Get.arguments as MovieData),
    );
  }
}