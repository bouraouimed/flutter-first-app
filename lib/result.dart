import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function reset;

  Result({required this.score, required this.reset});

  @override
  Widget build(BuildContext context) {
    // return Center(child: Text('You did it!: ${score}'));
    return Center(
        child: Column(
      children: <Widget>[
        Text('You did it!: ${score}'),
        ElevatedButton(
          onPressed: () => reset(),
          child: Text('Restart Quiz!'),
        )
      ],
    ));
  }
}
