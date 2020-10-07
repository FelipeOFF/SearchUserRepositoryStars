import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';
import 'user_repository_controller.dart';

class UserRepositoryPage extends StatefulWidget {
  final NodeUser nodeUser;
  const UserRepositoryPage({Key key, this.nodeUser}) : super(key: key);

  @override
  _UserRepositoryPageState createState() => _UserRepositoryPageState();
}

class _UserRepositoryPageState extends ModularState<UserRepositoryPage, UserRepositoryController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    controller.addUser(widget.nodeUser);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(controller.nodeUser.login),
                background: Hero(
                  tag: controller.nodeUser.avatarUrl,
                  child: Image.network(
                    controller.nodeUser.avatarUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Observer(builder: (_) {
          return ListView.builder(
            itemBuilder: (context, index) {
              EdgesRepository edges = controller.nodeUser.starredRepositories.edges[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(edges.node.name),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: _makeDescription(edges),
                      ),
                      trailing: Column(
                        children: [
                          Expanded(child: Text(edges.node.stargazerCount.toString())),
                          Expanded(child: Icon(Icons.star)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: controller.nodeUser.starredRepositories.edges.length,
          );
        }),
      ),
    );
  }

  StatelessWidget _makeDescription(EdgesRepository edges) => edges.node.description != null
      ? Text(
          edges.node.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        )
      : Container();
}
