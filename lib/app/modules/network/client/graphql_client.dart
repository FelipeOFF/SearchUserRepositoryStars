import 'package:github_repository_stars/app/modules/network/global.dart';
import 'package:graphql/client.dart';

class GraphqlClient {
  final GraphQLClient _client = GraphQLClient(cache: InMemoryCache(), link: Global.url);

  GraphQLClient getClient() => _client;
}
