import 'dart:async';

import 'package:github_repository_stars/app/modules/base/controller/base_controller.dart';
import 'package:github_repository_stars/app/modules/domain/usecase/github_usecase.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';
import 'package:github_repository_stars/app/modules/model/search_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends BaseController with Store {
  final GitHubUseCase _gitHubUseCase;

  _HomeControllerBase(this._gitHubUseCase);

  @observable
  bool showSearchBar = false;

  @observable
  QueryGithubUserRepositoryStars query;

  @observable
  String searchValue;

  @action
  togleShowSearchBar() {
    showSearchBar = !showSearchBar;
  }

  @action
  goToNextPage() async {
    await exec(
      SearchModel(searchValue, afterCursor: query.search.pageInfo.endCursor),
      _gitHubUseCase,
      onSuccess: _paginationValues,
      waitIfHaveMoreCalls: Duration(seconds: 1),
    );
  }

  @action
  search(String name) async {
    searchValue = name != null ? name : searchValue;
    await exec(
      SearchModel(searchValue),
      _gitHubUseCase,
      onSuccess: _paginationValues,
      onInitProcessiong: () => query = null,
      waitIfHaveMoreCalls: Duration(seconds: 1),
    );
  }

  void _paginationValues(query) {
    List<Edges> currentSearchEdges = List.from(this.query?.search?.edges ?? []);
    currentSearchEdges.removeWhere((element) => element is EdgeLoad);
    if (query?.search?.pageInfo?.hasNextPage == true) {
      List<Edges> edges = query.search.edges;
      currentSearchEdges.addAll(edges);
      currentSearchEdges.add(EdgeLoad());
      query.search.edges = currentSearchEdges;
    }
    this.query = query;
  }
}
