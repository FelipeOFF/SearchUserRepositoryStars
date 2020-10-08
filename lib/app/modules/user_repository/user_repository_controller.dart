import 'package:github_repository_stars/app/modules/base/controller/base_controller.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'user_repository_controller.g.dart';

@Injectable()
class UserRepositoryController = _UserRepositoryControllerBase with _$UserRepositoryController;

abstract class _UserRepositoryControllerBase extends BaseController with Store {
  @observable
  NodeUser nodeUser;

  @action
  void addUser(NodeUser nodeUser) {
    nodeUser.starredRepositories.edges =
        nodeUser.starredRepositories.edges.fold<List<EdgesRepository>>(<EdgesRepository>[], (previousValue, element) {
      if (element is EdgesRepository) {
        previousValue.add(element);
      }
      return previousValue;
    }).toList()
          ..sort((repA, repB) => repB.node.stargazerCount.compareTo(repA.node.stargazerCount));
    this.nodeUser = nodeUser;
  }
}
