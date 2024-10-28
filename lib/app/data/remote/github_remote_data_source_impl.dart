import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/remote/github_remote_data_source.dart';
import '/app/network/dio_provider.dart';

class GithubRemoteDataSourceImpl extends BaseRemoteSource
    implements GithubRemoteDataSource {
  @override
  Future<MovieListResponse> searchGithubProject(
      GithubSearchQueryParam queryParam) {
    var endpoint = "https://yts.mx/api/v2/list_movies.json?sort_by=popular&order_by=desc&limit=2";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseGithubProjectSearchResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  MovieListResponse _parseGithubProjectSearchResponse(
      Response<dynamic> response) {
    return MovieListResponse.fromJson(response.data);
  }
}
