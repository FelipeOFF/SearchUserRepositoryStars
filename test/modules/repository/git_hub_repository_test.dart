import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_stars/app/modules/model/search_model.dart';
import 'package:github_repository_stars/app/modules/repository/github_repository.dart';
import 'package:github_repository_stars/app/modules/repository/i_github_repository.dart';
import 'package:graphql/client.dart';
import 'package:mockito/mockito.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

main() {
  IGithubRepository repository;
  GraphQLClientMock client = GraphQLClientMock();

  setUp(() {
    repository = GithubRepository(client);
  });

  test(
      "On call getQueryGithubUserRepositoryStars giving SearchModel contains string value search, then return QueryResult",
      () async {
    SearchModel sm = SearchModel("Search value");
    QueryResult resultMock = QueryResult(data: "Value");

    when(client.query(any)).thenAnswer((invocation) => Future.value(resultMock));

    var result = await repository.getQueryGithubUserRepositoryStars(sm);

    expect(result, resultMock);
    expect(result.data, isNotNull);
    expect(result.exception, isNull);
    expect(result.hasException, false);

    verify(client.query(any)).called(1);
  });

  test("On call getQueryGithubUserRepositoryStars giving SearchModel contains string value search, then return error",
      () async {
    SearchModel sm = SearchModel("Search value");
    QueryResult resultMock = QueryResult(data: null, exception: OperationException());

    when(client.query(any)).thenAnswer((invocation) => Future.value(resultMock));

    var result = await repository.getQueryGithubUserRepositoryStars(sm);

    expect(result, resultMock);
    expect(result.data, isNull);
    expect(result.exception, isNotNull);
    expect(result.hasException, true);

    verify(client.query(any)).called(1);
  });
}
