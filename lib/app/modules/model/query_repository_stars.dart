class QueryGithubUserRepositoryStars {
  Search _search;

  QueryGithubUserRepositoryStars({Search search}) {
    this._search = search;
  }

  Search get search => _search;
  set search(Search search) => _search = search;

  QueryGithubUserRepositoryStars.fromJson(Map<String, dynamic> json) {
    _search = json['search'] != null ? new Search.fromJson(json['search']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._search != null) {
      data['search'] = this._search.toJson();
    }
    return data;
  }
}

class Search {
  int _userCount;
  PageInfo _pageInfo;
  List<Edges> _edges;

  Search({int userCount, PageInfo pageInfo, List<EdgesUser> edges}) {
    this._userCount = userCount;
    this._pageInfo = pageInfo;
    this._edges = edges;
  }

  int get userCount => _userCount;
  set userCount(int userCount) => _userCount = userCount;
  PageInfo get pageInfo => _pageInfo;
  set pageInfo(PageInfo pageInfo) => _pageInfo = pageInfo;
  List<Edges> get edges => _edges;
  set edges(List<Edges> edges) => _edges = edges;

  Search.fromJson(Map<String, dynamic> json) {
    _userCount = json['userCount'];
    _pageInfo = json['pageInfo'] != null ? new PageInfo.fromJson(json['pageInfo']) : null;
    if (json['edges'] != null) {
      _edges = new List<Edges>();
      json['edges'].forEach((v) {
        _edges.add(new EdgesUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userCount'] = this._userCount;
    if (this._pageInfo != null) {
      data['pageInfo'] = this._pageInfo.toJson();
    }
    if (this._edges != null) {
      var listConverted = this._edges.map((v) => (v is EdgesUser) ? v.toJson() : null).toList();
      listConverted.removeWhere((element) => element == null);
      data['edges'] = listConverted;
    }
    return data;
  }
}

class PageInfo {
  String _startCursor;
  bool _hasNextPage;
  bool _hasPreviousPage;
  String _endCursor;

  PageInfo({String startCursor, bool hasNextPage, bool hasPreviousPage, String endCursor}) {
    this._startCursor = startCursor;
    this._hasNextPage = hasNextPage;
    this._hasPreviousPage = hasPreviousPage;
    this._endCursor = endCursor;
  }

  String get startCursor => _startCursor;
  set startCursor(String startCursor) => _startCursor = startCursor;
  bool get hasNextPage => _hasNextPage;
  set hasNextPage(bool hasNextPage) => _hasNextPage = hasNextPage;
  bool get hasPreviousPage => _hasPreviousPage;
  set hasPreviousPage(bool hasPreviousPage) => _hasPreviousPage = hasPreviousPage;
  String get endCursor => _endCursor;
  set endCursor(String endCursor) => _endCursor = endCursor;

  PageInfo.fromJson(Map<String, dynamic> json) {
    _startCursor = json['startCursor'];
    _hasNextPage = json['hasNextPage'];
    _hasPreviousPage = json['hasPreviousPage'];
    _endCursor = json['endCursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startCursor'] = this._startCursor;
    data['hasNextPage'] = this._hasNextPage;
    data['hasPreviousPage'] = this._hasPreviousPage;
    data['endCursor'] = this._endCursor;
    return data;
  }
}

abstract class Edges {}

class EdgeLoad implements Edges {}

class EdgesUser implements Edges {
  String _cursor;
  NodeUser _node;

  EdgesUser({String cursor, NodeUser node}) {
    this._cursor = cursor;
    this._node = node;
  }

  String get cursor => _cursor;
  set cursor(String cursor) => _cursor = cursor;
  NodeUser get node => _node;
  set node(NodeUser node) => _node = node;

  EdgesUser.fromJson(Map<String, dynamic> json) {
    _cursor = json['cursor'];
    _node = json['node'] != null ? new NodeUser.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this._cursor;
    if (this._node != null) {
      data['node'] = this._node.toJson();
    }
    return data;
  }
}

class EdgesRepository implements Edges {
  String _cursor;
  NodeRepository _node;

  EdgesRepository({String cursor, NodeRepository node}) {
    this._cursor = cursor;
    this._node = node;
  }

  String get cursor => _cursor;
  set cursor(String cursor) => _cursor = cursor;
  NodeRepository get node => _node;
  set node(NodeRepository node) => _node = node;

  EdgesRepository.fromJson(Map<String, dynamic> json) {
    _cursor = json['cursor'];
    _node = json['node'] != null ? new NodeRepository.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this._cursor;
    if (this._node != null) {
      data['node'] = this._node.toJson();
    }
    return data;
  }
}

class NodeUser {
  String _avatarUrl;
  String _login;
  String _bio;
  String _location;
  String _email;
  String _url;
  StarredRepositories _starredRepositories;

  NodeUser(
      {String avatarUrl,
      String login,
      String bio,
      String location,
      String email,
      String url,
      StarredRepositories starredRepositories}) {
    this._avatarUrl = avatarUrl;
    this._login = login;
    this._bio = bio;
    this._location = location;
    this._email = email;
    this._url = url;
    this._starredRepositories = starredRepositories;
  }

  String get avatarUrl => _avatarUrl;
  set avatarUrl(String avatarUrl) => _avatarUrl = avatarUrl;
  String get login => _login;
  set login(String login) => _login = login;
  String get bio => _bio;
  set bio(String bio) => _bio = bio;
  String get location => _location;
  set location(String location) => _location = location;
  String get email => _email;
  set email(String email) => _email = email;
  String get url => _url;
  set url(String url) => _url = url;
  StarredRepositories get starredRepositories => _starredRepositories;
  set starredRepositories(StarredRepositories starredRepositories) => _starredRepositories = starredRepositories;

  NodeUser.fromJson(Map<String, dynamic> json) {
    _avatarUrl = json['avatarUrl'];
    _login = json['login'];
    _bio = json['bio'];
    _location = json['location'];
    _email = json['email'];
    _url = json['url'];
    _starredRepositories =
        json['starredRepositories'] != null ? new StarredRepositories.fromJson(json['starredRepositories']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this._avatarUrl;
    data['login'] = this._login;
    data['bio'] = this._bio;
    data['location'] = this._location;
    data['email'] = this._email;
    data['url'] = this._url;
    if (this._starredRepositories != null) {
      data['starredRepositories'] = this._starredRepositories.toJson();
    }
    return data;
  }
}

class StarredRepositories {
  int _totalCount;
  List<Edges> _edges;

  StarredRepositories({int totalCount, List<Edges> edges}) {
    this._totalCount = totalCount;
    this._edges = edges;
  }

  int get totalCount => _totalCount;
  set totalCount(int totalCount) => _totalCount = totalCount;
  List<Edges> get edges => _edges;
  set edges(List<Edges> edges) => _edges = edges;

  StarredRepositories.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    if (json['edges'] != null) {
      _edges = new List<Edges>();
      json['edges'].forEach((v) {
        _edges.add(new EdgesRepository.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this._totalCount;
    if (this._edges != null) {
      var listConverted = this._edges.map((v) => (v is EdgesRepository) ? v.toJson() : null).toList();
      listConverted.removeWhere((element) => element == null);
      data['edges'] = listConverted;
    }
    return data;
  }
}

class NodeRepository {
  String _name;
  String _description;
  int _stargazerCount;
  String _url;

  Node({String name, String description, int stargazerCount, String url}) {
    this._name = name;
    this._description = description;
    this._stargazerCount = stargazerCount;
    this._url = url;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get description => _description;
  set description(String description) => _description = description;
  int get stargazerCount => _stargazerCount;
  set stargazerCount(int stargazerCount) => _stargazerCount = stargazerCount;
  String get url => _url;
  set url(String url) => _url = url;

  NodeRepository.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _description = json['description'];
    _stargazerCount = json['stargazerCount'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['description'] = this._description;
    data['stargazerCount'] = this._stargazerCount;
    data['url'] = this._url;
    return data;
  }
}
