import 'package:github_repository_stars/app/modules/repository/i_github_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IGithubRepository _githubRepository;

  _HomeControllerBase(this._githubRepository);

  @action
  void getValues() {
    _githubRepository.getQueryGithubUserRepositoryStars("FelipeOFF");
  }
}
