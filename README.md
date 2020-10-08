# Stars Repository

![Language](https://img.shields.io/badge/Dart-Flutter-blue)

This is a project made to consume the github graphql API, in it I'm looking for a user, typed in a text field and then I'm looking for the repositories that this user favored

## Features 🎨

- Mobx
- Grphql
- Flutter Modular
- Equatable
- GQL (para poder importar a query)
- Mockito (dev)
- Build Runner (dev)
- Flutter Test (dev)

## Token ⚙️

This project requires a token from github, so that it is possible to make queries using the github graphql API.

For this, it is necessary to follow the [instructions](https://docs.github.com/en/free-pro-team@latest/graphql/guides/forming-calls-with-graphql#authenticating-with-graphql) described on the website github

within the scope selection, it is necessary to select the repo scopes and within the scope of user only the option read: user and user: email is required

once the token is acquired you will only need to pass it via environment variable:

`--dart-define=TOKEN_AUTH=YOU_TOKEN`