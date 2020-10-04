import 'package:graphql/client.dart';

class Global {
  static const _GIT_HUB_HOST = "https://api.github.com/graphql";
  static final HttpLink _gitHubLink = HttpLink(uri: _GIT_HUB_HOST);

  static const _AUTH_GIT_HUB = String.fromEnvironment("TOKEN_AUTH");
  static final AuthLink _authLinkGithub = AuthLink(getToken: () async => 'Bearer $_AUTH_GIT_HUB');

  static final Link url = _authLinkGithub.concat(_gitHubLink);
}
