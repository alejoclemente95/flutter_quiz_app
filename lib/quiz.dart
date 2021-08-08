import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex][
              'questionText'], //We use [] to access a key in a map and we pass the key name
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList() //Since we are returning the map as a List, and the children accepts a List but we are passing a nested list, then we can use the spread operator (...) to take out all the individual items of the list
      ],
    );
  }
}
