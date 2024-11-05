import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/data/model/movie_list_response.dart';

class APIServiceLogic extends BaseRemoteSource {

  static APIServiceLogic sharedInstance = APIServiceLogic();

  Future<TrendingMoviesResponse> fetchTrendingMovies() {
    var endpoint = "https://api.themoviedb.org/3/trending/all/day?api_key=3416755058040f4da2f7205c914e9a9d";
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) {
            return TrendingMoviesResponse.fromJson(response.data);
          });
    } catch (e) {
      rethrow;
    }
  }

  Future<TrendingMoviesResponse> searchMovies(String query) {
    String encodedQuery = Uri.encodeQueryComponent(query);
    var endpoint = 'https://api.themoviedb.org/3/search/movie?query=$encodedQuery&api_key=3416755058040f4da2f7205c914e9a9d';
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) {
        return TrendingMoviesResponse.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

}