import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_repository_stars/app/modules/user_repository/user_repository_controller.dart';

import 'user_repository_page.dart';

class UserRepositoryModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserRepositoryController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => UserRepositoryPage(
                  nodeUser: args.data,
                )),
      ];

  static Inject get to => Inject<UserRepositoryModule>.of();
}
