import 'package:github_repository_stars/app/modules/network/dataset/i_git_hub_dataset.dart';
import 'package:github_repository_stars/app/modules/network/payload/payload.ast.g.dart' as payload;
import 'package:graphql/client.dart';

class GitHubDataset extends IGitHubDataset {
  final GraphQLClient client;

  GitHubDataset(this.client);

  @override
  Future<QueryResult> getUserRepositoryStar(String user, {int count = 20, String afterCursor}) async {
    return client.query(QueryOptions(
      documentNode: payload.document,
      variables: {
        "user": user,
        "count": count,
        "afterCursor": afterCursor,
      },
    ));
  }
}
