import 'package:get/get.dart';

import '../../../data/model/movie_list_response.dart';
import '../../../data/remote/api_service_logic.dart';
import '/app/core/base/base_controller.dart';

class SearchPageController extends BaseController {
  final RxList<MovieData> movieList = <MovieData>[].obs;

  void searchMovies(String query) {
    var response = APIServiceLogic.sharedInstance.searchMovies(query);

    callDataService(
      response,
      onSuccess: _handleProjectListResponseSuccess,
    );
  }

  void _handleProjectListResponseSuccess(TrendingMoviesResponse response) {
    movieList.clear();
    movieList.addAll(response.results);
  }
}