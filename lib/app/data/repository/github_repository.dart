import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';

abstract class GithubRepository {
  Future<MovieListResponse> searchProject(
      GithubSearchQueryParam queryParam);

}
