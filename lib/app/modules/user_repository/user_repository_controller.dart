import 'package:github_repository_stars/app/modules/base/controller/base_controller_controller.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'user_repository_controller.g.dart';

@Injectable()
class UserRepositoryController = _UserRepositoryControllerBase with _$UserRepositoryController;

abstract class _UserRepositoryControllerBase extends BaseControllerController with Store {
  @observable
  NodeUser nodeUser;

  @action
  void addUser(NodeUser nodeUser) {
    this.nodeUser = nodeUser;
  }
}
