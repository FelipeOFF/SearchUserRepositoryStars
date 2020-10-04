import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    controller.search("FelipeOFF");

    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (context) {
        if (controller.showLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.errorMessage != null) {
          return Center(
            child: Text(controller.errorMessage),
          );
        } else if (controller.query != null) {
          QueryGithubUserRepositoryStars query = controller.query;
          print(query.toJson());
        } else {
          return Center(
            child: Text("Opss..."),
          );
        }

        return Center(
          child: Text("Hello World"),
        );
      }),
    );
  }
}
