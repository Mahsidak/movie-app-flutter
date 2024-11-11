import 'package:flutter_getx_template/app/data/remote/api_service_logic.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/data/model/movie_list_response.dart';
import '/app/modules/home/model/github_project_ui_data.dart';

class HomeController extends BaseController {
  final pagingController = PagingController<GithubProjectUiData>();

  final RxList<MovieData> movieList = <MovieData>[].obs;

  void getMovieList() {
    var response = APIServiceLogic.sharedInstance.fetchTrendingMovies();

    callDataService(
      response,
      onSuccess: _handleProjectListResponseSuccess,
    );
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getMovieList();
  }

  onLoadNextPage() {
    logger.i("On load next");

    getMovieList();
  }

  void _handleProjectListResponseSuccess(MoviesResponse response) {
    movieList.addAll(response.results);
  }
}
