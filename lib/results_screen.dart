import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/data/questions.dart';

import 'package:second_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
    this.startQuiz, {
    super.key,
    required this.chosenAnswers,
  });

  final void Function() startQuiz;
  final List<String> chosenAnswers;
  final List<Map<String, Object>> summary = [];

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int init = 0; init < chosenAnswers.length; init++) {
      summary.add({
        'question_index': init + 1,
        'question': questions[init].text,
        'correct_answer': questions[init].answers[0],
        'user_answer': chosenAnswers[init]
      });
      // if (questions[init].answers[0] == chosenAnswers[init]) {
      //   totalCorrectAnswers++;
      // }
    }

    return summary;
  }

  @override
  Widget build(context) {
    final int totalQuestions = questions.length;
    final int totalCorrectAnswers = summaryData
        .where(
          (element) => element['correct_answer'] == element['user_answer'],
        )
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answerd $totalCorrectAnswers of $totalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 200, 253),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData, chosenAnswers),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: startQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('Restart Quiz!'),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
