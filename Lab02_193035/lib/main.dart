import 'package:flutter/material.dart';

import './clothes_question.dart';
import './question_choice.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void iWasTapped() => print('I was tapped');
  var questions = [
    {
      "question": "What clothing type do you want to choose?",
      "answers": [
        "Dresses",
        "Jeans",
        "Shirts",
      ],
    },
    {
      "question": "What size do you want?",
      "answers": [
        "XS",
        "S",
        "M",
        "L",
      ],
    },
    {
      "question": "Which color do you want?",
      "answers": [
        "Red",
        "White",
        "Black",
      ]
    }
  ];
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      if (_questionIndex < questions.length - 1) {
        _questionIndex += 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clothes Shop",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Clothes Shop Jana"),
        ),
        body: Column(
          children: [
            ClothesQuestion(questions[_questionIndex]['question'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return QuestionChoice(
                _answerQuestion,
                answer,
              );
            })
          ],
        ),
      ),
    );
  }
}
