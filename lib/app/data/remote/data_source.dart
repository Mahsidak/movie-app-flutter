import '../model/movie_bookmark_request.dart';
import '../model/movie_bookmark_response.dart';
import '../model/movie_list_response.dart';

abstract class DataSource {
  Future<MoviesResponse> fetchTrendingMovies();
  Future<MoviesResponse> searchMovies(String query);
  Future<MovieBookmarkResponse> bookmarkMovie(MovieBookmarkRequest queryParam);
  Future<MoviesResponse> getBookmarkedMovies();
}