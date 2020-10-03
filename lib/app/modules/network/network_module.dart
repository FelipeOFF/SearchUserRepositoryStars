import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_repository_stars/app/modules/network/client/graphql_client.dart';
import 'package:graphql/client.dart';

class NetworkModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<GraphQLClient>((i) => GraphqlClient().getClient()),
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<NetworkModule>.of();
}
