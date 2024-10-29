import 'package:get/get.dart';

import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/movie_list_response.dart';
import '/app/data/remote/github_remote_data_source.dart';
import '/app/data/repository/github_repository.dart';

class GithubRepositoryImpl implements GithubRepository {
  final GithubRemoteDataSource _remoteSource =
      Get.find(tag: (GithubRemoteDataSource).toString());

  @override
  Future<MovieListResponse> searchProject(
      GithubSearchQueryParam queryParam) {
    return _remoteSource.searchGithubProject(queryParam);
  }
}