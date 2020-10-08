import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_stars/app/modules/domain/result_wrapper.dart';
import 'package:github_repository_stars/app/modules/domain/usecase/github_usecase.dart';
import 'package:github_repository_stars/app/modules/home/home_controller.dart';
import 'package:github_repository_stars/app/modules/model/query_repository_stars.dart';
import 'package:github_repository_stars/app/modules/model/search_model.dart';
import 'package:mockito/mockito.dart';

class GitHubUseCaseMock extends Mock implements GitHubUseCase {}

main() {
  GitHubUseCaseMock gitHubUseCaseMock = GitHubUseCaseMock();
  HomeController homeController = HomeController(gitHubUseCaseMock);

  test("on search name of user and return the user detail and repositories", () async {
    Map<String, dynamic> jsonReturn = getJsonMock();
    QueryGithubUserRepositoryStars result = QueryGithubUserRepositoryStars.fromJson(jsonReturn);
    String nameSearch = "Felipe";

    when(gitHubUseCaseMock.call(SearchModel(nameSearch))).thenAnswer((realInvocation) => Stream.value(Success(result)));

    await homeController.search(nameSearch);

    await Future.delayed(Duration(seconds: 2));

    expect(homeController.query, result);
  });

  test("go to next page and return the user detail and repositories", () async {
    Map<String, dynamic> jsonReturn = getJsonMock();
    QueryGithubUserRepositoryStars result = QueryGithubUserRepositoryStars.fromJson(jsonReturn);
    String searchValue = "Felipe";
    homeController.searchValue = searchValue;
    homeController.query = result;

    when(gitHubUseCaseMock.call(SearchModel(searchValue, afterCursor: result.search.pageInfo.endCursor)))
        .thenAnswer((realInvocation) => Stream.value(Success(result)));

    await homeController.goToNextPage();

    await Future.delayed(Duration(seconds: 2));

    expect(homeController.query, result);
  });
}

Map<String, dynamic> getJsonMock() => {
      "search": {
        "userCount": 26445,
        "pageInfo": {
          "startCursor": "Y3Vyc29yOjE=",
          "hasNextPage": true,
          "hasPreviousPage": false,
          "endCursor": "Y3Vyc29yOjQ="
        },
        "edges": [
          {
            "cursor": "Y3Vyc29yOjE=",
            "node": {
              "avatarUrl":
                  "https://avatars0.githubusercontent.com/u/420001?u=4e22badb6ea51f907740e2a203722a54ca550622&v=4",
              "login": "felipe",
              "bio": "",
              "location": "Denver, CO",
              "email": "",
              "url": "https://github.com/felipe",
              "starredRepositories": {
                "totalCount": 116,
                "edges": [
                  {
                    "node": {
                      "name": "jekyll",
                      "description": ":globe_with_meridians: Jekyll is a blog-aware static site generator in Ruby",
                      "stargazerCount": 41366,
                      "url": "https://github.com/jekyll/jekyll"
                    }
                  },
                  {
                    "node": {
                      "name": "SBJson",
                      "description": "This framework implements a strict JSON parser and generator in Objective-C.",
                      "stargazerCount": 3767,
                      "url": "https://github.com/SBJson/SBJson"
                    }
                  },
                ]
              }
            }
          },
        ],
      },
    };
