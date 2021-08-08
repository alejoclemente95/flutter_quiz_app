import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   //MyApp app = MyApp();
//   runApp(MyApp());
// }

//This can be used when having functions that only have one expression in the body.
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//To declare that a class is "private" we add a leading underscore to the class name
//the reason to do that is to protect the access to the properties of this class from the outside
//i.e. if this widget is used in some other place, make sure that the properties that control the
//state of this widget can't be accessed or modified from an external component.
class _MyAppState extends State<MyApp> {
  //to declare a property as private, we do the same, we use a leading underscore before the name of the property.
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Cual es tu color favorito?',
      'answers': [
        {'text': 'Azul', 'score': 10},
        {'text': 'Amarillo', 'score': 6},
        {'text': 'Rojo', 'score': 5},
        {'text': 'Blanco', 'score': 2}
      ]
    },
    {
      'questionText': 'Cual es tu mascota preferida?',
      'answers': [
        {'text': 'Oso', 'score': 10},
        {'text': 'Yogui', 'score': 6},
        {'text': 'Careta', 'score': 4},
        {'text': 'Chela', 'score': 2}
      ]
    },
    {
      'questionText': 'Quien es tu instructor favorito?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Tim', 'score': 7},
        {'text': 'Bharatt', 'score': 5},
        {'text': 'Ranga', 'score': 2}
      ]
    }
  ];

  //same with functions, a leading underscore will make this method as private
  void _answerQuestion(int score) {
    _totalScore += score;
    print(_totalScore);
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //home is the main widget that flkutter will bring on the screen when the app is mounted to the screen
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        //body: Text("This is my default text"), //scaffold only allows one widget as the body
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                _totalScore,
                _resetQuiz,
              ),
      ),
    );
  }
}
