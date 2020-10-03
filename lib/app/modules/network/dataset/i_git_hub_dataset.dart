import 'package:graphql/client.dart';

abstract class IGitHubDataset {
  Future<QueryResult> getUserRepositoryStar(String user, {int count = 20, String afterCursor});
}
