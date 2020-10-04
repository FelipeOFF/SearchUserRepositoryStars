import 'package:github_repository_stars/app/modules/base/controller/base_controller_controller.dart';
import 'package:github_repository_stars/app/modules/domain/usecase/github_usecase.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends BaseControllerController with Store {
  final GitHubUseCase _gitHubUseCase;

  _HomeControllerBase(this._gitHubUseCase);

  @observable
  QueryGithubUserRepositoryStars query;

  @action
  search(String name) async {
    exec(name, _gitHubUseCase, onSuccess: (query) => this.query = query);
  }
}
