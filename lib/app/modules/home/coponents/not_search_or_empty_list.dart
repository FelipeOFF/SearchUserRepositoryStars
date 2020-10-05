import 'package:flutter/material.dart';

class NotSearchOrEmptyList extends StatelessWidget {
  const NotSearchOrEmptyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_upward,
          size: 60,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Text(
            "Digite um nome ou apelido de algum usuario na barra de pesquisa para poder achar os repositórios favoritados",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
