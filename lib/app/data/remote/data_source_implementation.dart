import 'dart:convert';

import '../../network/serviceHandler/api_enum.dart';
import '../../network/serviceHandler/api_service.dart';
import '../model/movie_bookmark_request.dart';
import '../model/movie_bookmark_response.dart';
import '/app/data/model/movie_list_response.dart';
import 'data_source.dart';

class DataSourceImplementation extends DataSource {
  static DataSource sharedInstance = DataSourceImplementation();

  Future<MoviesResponse> fetchTrendingMovies() async {
    var endpoint =
        "https://api.themoviedb.org/3/trending/all/day?api_key=3416755058040f4da2f7205c914e9a9d";
    try {
      final response = await APIService.sharedInstance
          .genericNetworkRequest(path: endpoint, method: RequestMethod.GET);

      final jsonData = jsonDecode(response.body);

      return MoviesResponse.fromJson(jsonData);
    } catch (e) {
      print('Exception: $e');
      throw Exception('An error occurred: $e');
    }
  }

  Future<MoviesResponse> searchMovies(String query) async {
    String encodedQuery = Uri.encodeQueryComponent(query);
    var endpoint =
        'https://api.themoviedb.org/3/search/movie?query=$encodedQuery&api_key=3416755058040f4da2f7205c914e9a9d';
    try {
      final response = await APIService.sharedInstance
          .genericNetworkRequest(path: endpoint, method: RequestMethod.GET);

      if (response.statusCode == ResponseCode.OPERATION_SUCCESSFUL) {
        final jsonData = jsonDecode(response.body);

        return MoviesResponse.fromJson(jsonData);
      } else {
        print('Error: ${response.body}');
        throw Exception('Failed to search movies: ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('An error occurred: $e');
    }
  }

  Future<MovieBookmarkResponse> bookmarkMovie(MovieBookmarkRequest queryParam) async {
    var endpoint = 'https://api.themoviedb.org/3/account/18829666/favorite';
    try {
      final response = await APIService.sharedInstance
          .genericNetworkRequest(path: endpoint, method: RequestMethod.GET);

      if (response.statusCode == ResponseCode.OPERATION_SUCCESSFUL) {
        final jsonData = jsonDecode(response.body);

        return MovieBookmarkResponse.fromJson(jsonData);
      } else {
        print('Error: ${response.body}');
        throw Exception('Failed to bookmark movie: ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('An error occurred: $e');
    }
  }

  Future<MoviesResponse> getBookmarkedMovies() async {
    var endpoint = 'https://api.themoviedb.org/3/account/18829666/favorite/movies';
    try {
      final response = await APIService.sharedInstance
          .genericNetworkRequest(path: endpoint, method: RequestMethod.GET);

      if (response.statusCode == ResponseCode.OPERATION_SUCCESSFUL) {
        final jsonData = jsonDecode(response.body);

        return MoviesResponse.fromJson(jsonData);
      } else {
        print('Error: ${response.body}');
        throw Exception('Failed to get bookmarks: ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('An error occurred: $e');
    }
  }

}
