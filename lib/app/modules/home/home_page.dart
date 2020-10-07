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

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getGithubAppBar(),
      body: Container(
        color: Colors.grey.shade200,
        child: Observer(builder: (context) {
          if (controller.showLoading && controller.query == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.errorMessage != null) {
            return Center(
              child: Text(controller.errorMessage),
            );
          } else if (controller.query != null) {
            QueryGithubUserRepositoryStars query = controller.query;
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) => checkIsActivePagination(scrollInfo, query),
              child: ListView.builder(
                itemCount: query.search.edges.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (widgetContext, index) {
                  Edges edge = controller.query.search.edges[index];

                  if (edge is EdgeLoad) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (edge is EdgesUser) {
                    return GitHubUserCard(
                      user: edge.node,
                      onShowRepository: () {
                        controller.showSearchBar = false;
                        Navigator.pushNamed(context, "/user_repository", arguments: edge.node);
                      },
                    );
                  } else {
                    throw Exception("Edge is not user and not Load, who is Edge?");
                  }
                },
              ),
            );
          }

          return NotSearchOrEmptyList();
        }),
      ),
    );
  }

  bool checkIsActivePagination(ScrollNotification scrollInfo, QueryGithubUserRepositoryStars query) {
    if (!controller.showLoading) {
      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && query.search.pageInfo.hasNextPage) {
        controller.goToNextPage();
      }
    }
    return true;
  }

  Widget getGithubAppBar() => AppBar(
        title: Observer(
          builder: (context) {
            return makeTextFieldForSearch();
          },
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
      _focusNode.requestFocus();
      return TextField(
        style: TextStyle(
          color: Colors.white,
        ),
        focusNode: _focusNode,
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
