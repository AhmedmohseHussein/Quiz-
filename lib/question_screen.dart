// build in packages
import 'package:flutter/material.dart';

// third party packages
import 'package:google_fonts/google_fonts.dart';
// local packages
import 'package:second_app/answer_button.dart';
import 'package:second_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int index = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectedAnswer(selectedAnswer);
      index++;

      // answers.add();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currintQuestion = questions[index];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currintQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    // fontFamily: ,
                    fontSize: 24,
                    color: Color.fromARGB(255, 237, 223, 252),
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(
              height: 30,
            ),

            ...currintQuestion.getSuffledList().map(
                  (answer) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: AnswerButton(
                      answerText: answer,
                      onTap: () {
                        answerQuestion(answer);
                      },
                    ),
                  ),
                ),

            //  for(int start = 0;start<questions[currintQuestionIndix].answers.length;start++){
            //     AnswerButton(
            //     answerText: questions[currintQuestionIndix].answers[start],
            //     nextQuestion: () {},
            //   ),
            //   }.toList(),
          ],
        ),
      ),
    );
  }
}
