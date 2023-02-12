import 'package:flutter/material.dart';

class ClothesQuestion extends StatelessWidget {
  final String _questionText;

  ClothesQuestion(this._questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        _questionText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
