import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _score = 0;

  final _questions = [
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 2},
        {'text': 'Lion', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Yellow', 'score': 1},
        {'text': 'Purple', 'score': 2},
        {'text': 'Blue', 'score': 3}
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  void _answerQuestion(int score) {
    this._score += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(score: _score, reset: _resetQuiz),
      ),
    );
  }
}
