import 'package:github_repository_stars/app/modules/base/controller/base_controller.dart';
import 'package:github_repository_stars/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_stars/app/app_widget.dart';
import 'package:github_repository_stars/app/modules/home/home_module.dart';
import 'package:github_repository_stars/app/modules/network/client/graphql_client.dart';
import 'package:github_repository_stars/app/modules/repository/github_repository.dart';
import 'package:github_repository_stars/app/modules/repository/i_github_repository.dart';
import 'package:github_repository_stars/app/modules/user_repository/user_repository_module.dart';
import 'package:graphql/client.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BaseController()),
        Bind((i) => AppController()),
        Bind<GraphQLClient>((i) => GraphqlClient().getClient()),
        Bind<IGithubRepository>((i) => GithubRepository(i.get()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter("/user_repository", module: UserRepositoryModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
