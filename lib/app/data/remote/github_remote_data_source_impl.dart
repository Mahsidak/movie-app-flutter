import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/movie_list_response.dart';
import '/app/data/remote/github_remote_data_source.dart';

class GithubRemoteDataSourceImpl extends BaseRemoteSource
    implements GithubRemoteDataSource {
  @override
  Future<TrendingMoviesResponse> searchGithubProject(
      GithubSearchQueryParam queryParam) {
    var endpoint = "https://api.themoviedb.org/3/trending/all/day?api_key=3416755058040f4da2f7205c914e9a9d";
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) {
            return _parseGithubProjectSearchResponse(response);
          });
    } catch (e) {
      rethrow;
    }
  }

  TrendingMoviesResponse _parseGithubProjectSearchResponse(
      Response<dynamic> response) {
    return TrendingMoviesResponse.fromJson(response.data);
  }
}
