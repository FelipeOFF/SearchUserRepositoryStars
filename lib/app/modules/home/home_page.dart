import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_repository_stars/app/modules/home/coponents/github_user_card.dart';
import 'package:github_repository_stars/app/modules/home/coponents/not_search_or_empty_list.dart';
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
    return Scaffold(
      appBar: getGithubAppBar(),
      body: Container(
        color: Colors.grey.shade200,
        child: Observer(builder: (context) {
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
            return ListView.builder(
              itemCount: query.search.edges.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (widgetContext, index) {
                return GitHubUserCard(user: controller.query.search.edges[index].node);
              },
            );
          }

          return NotSearchOrEmptyList();
        }),
      ),
    );
  }

  Widget getGithubAppBar() => AppBar(
        title: Observer(
          builder: (context) => makeTextFieldForSearch(),
        ),
        actions: [
          Observer(builder: (context) => makeIconButtonForSearch()),
        ],
      );

  IconButton makeIconButtonForSearch() {
    if (controller.showSearchBar) {
      return IconButton(
        icon: Icon(
          Icons.close,
          semanticLabel: "Fechar",
          color: Colors.white,
        ),
        onPressed: controller.togleShowSearchBar,
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.search,
          semanticLabel: "Buscar",
          color: Colors.white,
        ),
        onPressed: controller.togleShowSearchBar,
      );
    }
  }

  Widget makeTextFieldForSearch() {
    if (controller.showSearchBar) {
      return TextField(
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "Search...",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        onChanged: controller.search,
      );
    } else {
      return Text("Github search stars");
    }
  }
}
