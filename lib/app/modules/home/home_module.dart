import 'package:github_repository_stars/app/modules/domain/usecase/github_usecase.dart';
import 'package:github_repository_stars/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_repository_stars/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => GitHubUseCase(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
