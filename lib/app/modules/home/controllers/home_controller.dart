import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/movie_list_response.dart';
import '/app/data/repository/github_repository.dart';
import '/app/modules/home/model/github_project_ui_data.dart';

class HomeController extends BaseController {
  final GithubRepository _repository =
  Get.find(tag: (GithubRepository).toString());

  final pagingController = PagingController<GithubProjectUiData>();

  final RxList<Movie> movieList = <Movie>[].obs;

  void getMovieList() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    var queryParam = GithubSearchQueryParam(
      searchKeyWord: 'flutter getx template',
      pageNumber: pagingController.pageNumber,
    );

    var githubRepoSearchService = _repository.searchProject(queryParam);

    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getMovieList();
  }

  onLoadNextPage() {
    logger.i("On load next");

    getMovieList();
  }

  void _handleProjectListResponseSuccess(MovieListResponse response) {
    movieList.addAll(response.data.movies);
  }
}
