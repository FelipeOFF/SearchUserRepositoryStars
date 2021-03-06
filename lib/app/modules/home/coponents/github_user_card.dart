import 'package:flutter/material.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';

import 'package:github_repository_stars/app/modules/util/url_util.dart';

class GitHubUserCard extends StatelessWidget {
  const GitHubUserCard({Key key, @required this.user, @required this.onShowRepository}) : super(key: key);

  final NodeUser user;
  final void Function() onShowRepository;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(50),
            bottomRight: const Radius.circular(50),
          ),
        ),
        elevation: 2,
        child: Container(
          height: 244,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Hero(
                              tag: user.avatarUrl,
                              child: Image.network(
                                user.avatarUrl,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    makeLoginText(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: makeBioText(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: makeEmailText(),
                        ),
                        makeLocationText(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FlatButton(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          onPressed: onShowRepository,
                          child: Text("Ver repositórios favoritos"),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          onPressed: () async {
                            await UrlUtil.tryOpenUrlInBrowser(user.url);
                          },
                          child: Text(
                            user.url,
                            style: TextStyle(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text makeLoginText() {
    return Text(
      user.login,
      textAlign: TextAlign.end,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
    );
  }

  Widget makeEmailText() => makeTextForBioEmailAndLocation(user.email, maxLines: 1);

  Widget makeLocationText() => makeTextForBioEmailAndLocation(user.location);

  Widget makeBioText() => makeTextForBioEmailAndLocation(user.bio);

  Widget makeTextForBioEmailAndLocation(String value, {int maxLines = 4}) => value != null
      ? Text(
          value,
          textAlign: TextAlign.end,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 13,
          ),
        )
      : Container();
}
