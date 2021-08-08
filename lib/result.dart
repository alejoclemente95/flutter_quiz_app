import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetScore;
  Result(this.resultScore, this.resetScore);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 8) {
      resultText = "Eres genial";
    } else if (resultScore <= 12) {
      resultText = "Que agradable sujeto";
    } else if (resultScore <= 16) {
      resultText = "hmm raro";
    } else {
      resultText = "Necesita mejorar";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz!'),
            onPressed: resetScore,
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue)),
          )
        ],
      ),
    );
  }
}
