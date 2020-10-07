import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_stars/app/modules/domain/exceptions/server_exception.dart';
import 'package:github_repository_stars/app/modules/domain/result_wrapper.dart';
import 'package:github_repository_stars/app/modules/domain/usecase/github_usecase.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';
import 'package:github_repository_stars/app/modules/model/search_model.dart';
import 'package:github_repository_stars/app/modules/repository/i_github_repository.dart';
import 'package:graphql/client.dart';
import 'package:mockito/mockito.dart';

class GitHubRepositoryMock extends Mock implements IGithubRepository {}

main() {
  IGithubRepository repository;
  GitHubUseCase useCase;

  setUp(() {
    repository = GitHubRepositoryMock();
    useCase = GitHubUseCase(repository);
  });

  test("on execute search giving value query and return QueryGithubUserRepositoryStars", () async {
    SearchModel searchModel = SearchModel("Value to search");
    var json = {"search": null};
    QueryResult queryResult = QueryResult(data: json);

    when(repository.getQueryGithubUserRepositoryStars(searchModel)).thenAnswer((_) => Future.value(queryResult));

    var result = useCase(searchModel);

    expectLater(
      result,
      emitsInOrder(
        [
          Loading(),
          Success(QueryGithubUserRepositoryStars.fromJson(json)),
          DismissLoading(),
          emitsDone,
        ],
      ),
    );
  });

  test("on execute search giving value query and return error", () async {
    SearchModel searchModel = SearchModel("Value to search");
    String errorMenssage = "Error message";
    QueryResult queryResult = QueryResult(
      data: null,
      exception: OperationException(clientException: CacheMissException(errorMenssage, "ErrorKey")),
    );

    when(repository.getQueryGithubUserRepositoryStars(searchModel)).thenAnswer((_) => Future.value(queryResult));

    var result = useCase(searchModel);

    expectLater(
      result,
      emitsInOrder(
        [
          Loading(),
          Failure<QueryGithubUserRepositoryStars>(ServerException(errorMenssage)),
          DismissLoading(),
          emitsDone,
        ],
      ),
    );
  });
}
