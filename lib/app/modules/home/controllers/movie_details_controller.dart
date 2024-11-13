import 'package:flutter_getx_template/app/data/model/movie_bookmark_response.dart';
import 'package:flutter_getx_template/app/data/model/movie_list_response.dart';
import 'package:flutter_getx_template/app/data/remote/api_service_logic.dart';
import 'package:get/get.dart';

import '../../../data/model/movie_bookmark_request.dart';
import '/app/core/base/base_controller.dart';

class MovieDetailsController extends BaseController {
  final MovieData movieDetails = Get.arguments;

  final RxBool _addToFavResponse = RxBool(false);

  void addToFavourite() {
    MovieBookmarkRequest params = MovieBookmarkRequest();
    params.mediaId = movieDetails.id.toString();
    params.favorite = true;
    var response = APIServiceLogic.sharedInstance.bookmarkMovie(params);

    callDataService(
      response,
          onSuccess: _handleBookmarkResponseSuccess,
        );
  }

  void _handleBookmarkResponseSuccess(MovieBookmarkResponse response) {
    _addToFavResponse(response.success);
  }

}