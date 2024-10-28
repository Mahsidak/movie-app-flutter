import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';
import '/app/modules/home/model/github_project_ui_data.dart';

class HomeController extends BaseController {
  final GithubRepository _repository =
      Get.find(tag: (GithubRepository).toString());

  final RxList<GithubProjectUiData> _githubProjectListController =
      RxList.empty();

  List<GithubProjectUiData> get projectList =>
      _githubProjectListController.toList();

  final pagingController = PagingController<GithubProjectUiData>();

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
    print(response.data.movies.first.title);
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (projectList.length + newListItemCount) >= totalCount;
  }
}
