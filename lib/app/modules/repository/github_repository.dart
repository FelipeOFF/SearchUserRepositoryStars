import 'package:github_repository_stars/app/modules/repository/i_github_repository.dart';
import 'package:github_repository_stars/app/modules/network/payload/payload.ast.g.dart' as payload;
import 'package:graphql/client.dart';

class GithubRepository implements IGithubRepository {
  final GraphQLClient _client;

  GithubRepository(this._client);

  @override
  Future<QueryResult> getQueryGithubUserRepositoryStars(String userName, {int count = 20, String afterCursor}) async {
    return _client.query(QueryOptions(
      documentNode: payload.document,
      variables: {
        "nameOfUser": userName,
        "count": count,
        "afterCursor": afterCursor,
      },
    ));
  }
}
