import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, this.correctAnswer = 0}) : super(key: key);
  int correctAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text(
          "نتیجه آزمون ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Image(
              image: AssetImage("images/cup.png"),
            ),
          ),
          Text(
            "پاسخ های صحیح شما ",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "$correctAnswer",
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
