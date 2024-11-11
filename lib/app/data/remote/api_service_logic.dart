import 'package:dio/dio.dart';

import '../model/MovieBookmarkRequest.dart';
import '/app/core/base/base_remote_source.dart';
import '/app/data/model/movie_list_response.dart';

class APIServiceLogic extends BaseRemoteSource {

  static APIServiceLogic sharedInstance = APIServiceLogic();

  Future<MoviesResponse> fetchTrendingMovies() {
    var endpoint = "https://api.themoviedb.org/3/trending/all/day?api_key=3416755058040f4da2f7205c914e9a9d";
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) {
            return MoviesResponse.fromJson(response.data);
          });
    } catch (e) {
      rethrow;
    }
  }

  Future<MoviesResponse> searchMovies(String query) {
    String encodedQuery = Uri.encodeQueryComponent(query);
    var endpoint = 'https://api.themoviedb.org/3/search/movie?query=$encodedQuery&api_key=3416755058040f4da2f7205c914e9a9d';
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) {
        return MoviesResponse.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<MoviesResponse> bookmarkMovie(MovieBookmarkRequest queryParam) {
    var endpoint = "https://api.themoviedb.org/3/account/18829666/favorite";
    var dioCall = dioClient.post(endpoint, queryParameters: queryParam.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) {
        return MoviesResponse.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<MoviesResponse> getBookmarkedMovies() {
    var endpoint = "https://api.themoviedb.org/3/account/18829666/favorite/movies";
    var dioCall = dioClient.post(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) {
        return MoviesResponse.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

}