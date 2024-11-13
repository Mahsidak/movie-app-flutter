import 'package:get/get.dart';
import '../../../data/model/movie_bookmark_request.dart';
import '../../../data/model/movie_list_response.dart';
import '../../../data/remote/api_service_logic.dart';
import '/app/core/base/base_controller.dart';

class BookmarksController extends BaseController {
  final RxList<MovieData> movieList = RxList.empty();

  void getBookmarkedMovies() {
    var response = APIServiceLogic.sharedInstance.getBookmarkedMovies();
    callDataService(
      response,
      onSuccess: _handleFavMovieListResponseSuccess,
    );
  }

  void _handleFavMovieListResponseSuccess(MoviesResponse response) {
    movieList.clear();
    movieList.addAll(response.results);
  }

}