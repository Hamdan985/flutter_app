import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetHandler;

  Result(this.score, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (score <= 13) {
      resultText = 'You are Childish';
    } else if (score <= 18) {
      resultText = 'You are Mediocre';
    } else if (score <= 25) {
      resultText = 'You are a God';
    } else
      resultText = 'Invalid Personality';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Final Score :  $score \n $resultPhrase',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text('Reset Quiz'),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
