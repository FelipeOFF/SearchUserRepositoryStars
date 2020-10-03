import 'package:github_repository_stars/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_stars/app/app_widget.dart';
import 'package:github_repository_stars/app/modules/home/home_module.dart';
import 'package:github_repository_stars/app/modules/network/client/graphql_client.dart';
import 'package:github_repository_stars/app/modules/network/dataset/git_hub_dataset.dart';
import 'package:github_repository_stars/app/modules/network/dataset/i_git_hub_dataset.dart';
import 'package:graphql/client.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<GraphQLClient>((i) => GraphqlClient().getClient()),
        Bind<IGitHubDataset>((i) => GitHubDataset(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
