import 'package:github_repository_stars/app/modules/domain/exceptions/server_exception.dart';
import 'package:github_repository_stars/app/modules/domain/i_use_case.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';
import 'package:github_repository_stars/app/modules/repository/i_github_repository.dart';
import 'package:graphql/client.dart';

class GitHubUseCase extends IUseCase<String, QueryGithubUserRepositoryStars> {
  final IGithubRepository _repository;

  GitHubUseCase(this._repository);

  @override
  Future<QueryGithubUserRepositoryStars> execute(String value) async {
    QueryResult result = await _repository.getQueryGithubUserRepositoryStars(value);
    if (result.hasException) {
      throw ServerException(result.exception.clientException.message);
    } else {
      return QueryGithubUserRepositoryStars.fromJson(result.data);
    }
  }
}
