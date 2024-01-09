import 'package:flutter/material.dart';
import 'package:flutter_quizapp/constants/constants.dart';
import 'package:flutter_quizapp/data/questions.dart';
import 'package:flutter_quizapp/screens/result_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int correctAnswer = 0;
  Question? selectedQuestion;
  bool lastOrNot = false;

  @override
  Widget build(BuildContext context) {
    selectedQuestion = getQuestionsList()[questionIndex];
    String imageIndex = getQuestionsList()[questionIndex].imageNameNubmer!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        centerTitle: true,
        title: Text(
          "سوال ${questionIndex + 1} از ${getQuestionsList().length} ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity),
            Expanded(
              flex: 5,
              child: Image(
                image: AssetImage("images/$imageIndex.png"),
                height: 300,
              ),
            ),
            SizedBox(height: 30),
            Text(
              selectedQuestion!.questionTitle!,
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...List.generate(4, (index) => getOptionItem(index)),
            if (lastOrNot)
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: Size(200, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(correctAnswer: correctAnswer),
                      ),
                    );
                  },
                  child: Text(
                    "مشاهده نتایج کوییز",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget getOptionItem(int index) {
    return ListTile(
      title: Text(
        selectedQuestion!.answerList![index],
        textAlign: TextAlign.end,
      ),
      onTap: () {
        if (selectedQuestion!.correctAnswer == index) {
          correctAnswer++;
        } else {
          print("wrong");
        }

        if (questionIndex == getQuestionsList().length - 1) {
          lastOrNot = true;
        }
        setState(() {
          if (questionIndex < getQuestionsList().length - 1) {
            questionIndex++;
          }
        });
      },
    );
  }
}
