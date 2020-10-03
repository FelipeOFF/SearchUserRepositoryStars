import 'package:graphql/client.dart';

abstract class IGithubRepository {
  Future<QueryResult> getQueryGithubUserRepositoryStars(String userName, {int count = 20, String afterCursor});
}
