import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: const Center(
          child: Text(
            "NOTHING TO SEE HERE",
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
        ));
  }
}
