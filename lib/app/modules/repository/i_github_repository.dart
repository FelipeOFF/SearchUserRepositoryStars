import 'package:github_repository_stars/app/modules/model/search_model.dart';
import 'package:graphql/client.dart';

abstract class IGithubRepository {
  Future<QueryResult> getQueryGithubUserRepositoryStars(SearchModel search);
}
