import 'package:flutter/material.dart';

class QuestionChoice extends StatelessWidget {
  final String _choiceText;
  final VoidCallback _callBack;
  QuestionChoice(this._callBack, this._choiceText);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        child: Text(this._choiceText, style: TextStyle(color: Colors.red)),
        onPressed: this._callBack,
      ),
    );
  }
}
