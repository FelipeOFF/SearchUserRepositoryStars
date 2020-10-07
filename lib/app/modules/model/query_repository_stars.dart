class QueryGithubUserRepositoryStars {
  Search search;

  QueryGithubUserRepositoryStars({Search search}) {
    this.search = search;
  }

  QueryGithubUserRepositoryStars.fromJson(Map<String, dynamic> json) {
    search = json['search'] != null ? new Search.fromJson(json['search']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.search != null) {
      data['search'] = this.search.toJson();
    }
    return data;
  }
}

class Search {
  int userCount;
  PageInfo pageInfo;
  List<Edges> edges;

  Search({int userCount, PageInfo pageInfo, List<EdgesUser> edges}) {
    this.userCount = userCount;
    this.pageInfo = pageInfo;
    this.edges = edges;
  }

  Search.fromJson(Map<String, dynamic> json) {
    userCount = json['userCount'];
    pageInfo = json['pageInfo'] != null ? new PageInfo.fromJson(json['pageInfo']) : null;
    if (json['edges'] != null) {
      edges = new List<Edges>();
      json['edges'].forEach((v) {
        edges.add(new EdgesUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userCount'] = this.userCount;
    if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo.toJson();
    }
    if (this.edges != null) {
      var listConverted = this.edges.map((v) => (v is EdgesUser) ? v.toJson() : null).toList();
      listConverted.removeWhere((element) => element == null);
      data['edges'] = listConverted;
    }
    return data;
  }
}

class PageInfo {
  String startCursor;
  bool hasNextPage;
  bool hasPreviousPage;
  String endCursor;

  PageInfo({String startCursor, bool hasNextPage, bool hasPreviousPage, String endCursor}) {
    this.startCursor = startCursor;
    this.hasNextPage = hasNextPage;
    this.hasPreviousPage = hasPreviousPage;
    this.endCursor = endCursor;
  }

  PageInfo.fromJson(Map<String, dynamic> json) {
    startCursor = json['startCursor'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
    endCursor = json['endCursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startCursor'] = this.startCursor;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['endCursor'] = this.endCursor;
    return data;
  }
}

abstract class Edges {}

class EdgeLoad implements Edges {}

class EdgesUser implements Edges {
  String cursor;
  NodeUser node;

  EdgesUser({String cursor, NodeUser node}) {
    this.cursor = cursor;
    this.node = node;
  }

  EdgesUser.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    node = json['node'] != null ? new NodeUser.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this.cursor;
    if (this.node != null) {
      data['node'] = this.node.toJson();
    }
    return data;
  }
}

class EdgesRepository implements Edges {
  String cursor;
  NodeRepository node;

  EdgesRepository({String cursor, NodeRepository node}) {
    this.cursor = cursor;
    this.node = node;
  }

  EdgesRepository.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    node = json['node'] != null ? new NodeRepository.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this.cursor;
    if (this.node != null) {
      data['node'] = this.node.toJson();
    }
    return data;
  }
}

class NodeUser {
  String avatarUrl;
  String login;
  String bio;
  String location;
  String email;
  String url;
  StarredRepositories starredRepositories;

  NodeUser(
      {String avatarUrl,
      String login,
      String bio,
      String location,
      String email,
      String url,
      StarredRepositories starredRepositories}) {
    this.avatarUrl = avatarUrl;
    this.login = login;
    this.bio = bio;
    this.location = location;
    this.email = email;
    this.url = url;
    this.starredRepositories = starredRepositories;
  }

  NodeUser.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    login = json['login'];
    bio = json['bio'];
    location = json['location'];
    email = json['email'];
    url = json['url'];
    starredRepositories =
        json['starredRepositories'] != null ? new StarredRepositories.fromJson(json['starredRepositories']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this.avatarUrl;
    data['login'] = this.login;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['email'] = this.email;
    data['url'] = this.url;
    if (this.starredRepositories != null) {
      data['starredRepositories'] = this.starredRepositories.toJson();
    }
    return data;
  }
}

class StarredRepositories {
  int totalCount;
  List<Edges> edges;

  StarredRepositories({int totalCount, List<Edges> edges}) {
    this.totalCount = totalCount;
    this.edges = edges;
  }

  StarredRepositories.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['edges'] != null) {
      edges = new List<Edges>();
      json['edges'].forEach((v) {
        edges.add(new EdgesRepository.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.edges != null) {
      var listConverted = this.edges.map((v) => (v is EdgesRepository) ? v.toJson() : null).toList();
      listConverted.removeWhere((element) => element == null);
      data['edges'] = listConverted;
    }
    return data;
  }
}

class NodeRepository {
  String name;
  String description;
  int stargazerCount;
  String url;

  NodeRepository({String name, String description, int stargazerCount, String url}) {
    this.name = name;
    this.description = description;
    this.stargazerCount = stargazerCount;
    this.url = url;
  }

  NodeRepository.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    stargazerCount = json['stargazerCount'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['stargazerCount'] = this.stargazerCount;
    data['url'] = this.url;
    return data;
  }
}
