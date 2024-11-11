import 'package:flutter_getx_template/app/data/model/movie_list_response.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';

class MovieDetailsController extends BaseController {
  final MovieData movieDetails = Get.arguments;

  final RxBool _addToFavResponse = RxBool(false);
  bool get addToFavSuccessOrNot => _addToFavResponse.value;

  void addToFavourite({bool isFavourite = false}) {
    int id = Get.arguments;
    // var queryParam = AddToFavouriteQueryParam(mediaId: id.toString(), favorite: isFavourite);
    //
    // var movieDetailsService = _repository.addToFavourite(queryParam);
    // callDataService(
    //   movieDetailsService,
    //   onSuccess: _handleAddToFavouriteResponseSuccess,
    // );
  }

  // void _handleAddToFavouriteResponseSuccess(FavoriteResponse response) {
  //   _addToFavResponse(response.success);
  // }

}