import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_template/app/data/remote/data_source_implementation.dart';

import '/app/core/base/paging_controller.dart';
import '/app/data/model/movie_list_response.dart';
import '/app/modules/home/model/github_project_ui_data.dart';

class HomeViewModel {
  final pagingController = PagingController<GithubProjectUiData>();

  final ValueNotifier<List<MovieData>> movieList = ValueNotifier([]);

  Future<void> getMovieList() async {
    try {
      var response = await DataSourceImplementation.sharedInstance.fetchTrendingMovies();
      print(response);
      _handleProjectListResponseSuccess(response);
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  void onRefreshPage() {
    pagingController.initRefresh();
    movieList.value.clear();
    getMovieList();
  }

  void onLoadNextPage() {
    getMovieList();
  }

  void _handleProjectListResponseSuccess(MoviesResponse response) {
    movieList.value = response.results;
  }
}

