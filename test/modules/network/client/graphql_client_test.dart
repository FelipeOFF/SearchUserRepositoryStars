import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_stars/app/modules/network/client/graphql_client.dart';

main() {
  GraphqlClient client;

  setUp(() {
    client = GraphqlClient();
  });

  test("On initialize GraphqlClient can get _client", () {
    expect(client.getClient(), isNotNull);
  });
}
