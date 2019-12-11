import 'package:flutter/material.dart';
import 'package:new_app/quiz.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'What\'s Your Favourite Colour?',
        'answers': [
          {'text': 'Black', 'score': 5},
          {'text': 'Blue', 'score': 2},
          {'text': 'Pink', 'score': 3},
          {'text': 'Green', 'score': 1}
        ],
      },
      {
        'questionText': 'What\'s Your Favourite Animal?',
        'answers': [
          {'text': 'Lion', 'score': 6},
          {'text': 'Tiger', 'score': 9},
          {'text': 'Elephant', 'score': 8},
          {'text': 'Goat', 'score': 3}
        ],
      },
      {
        'questionText': 'What\'s Your Favourite   Food?',
        'answers': [
          {'text': 'Pizza', 'score': 8},
          {'text': 'Burger', 'score': 7},
          {'text': 'Dosa', 'score': 9},
          {'text': 'Tikki Pav', 'score': 15}
        ],
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
