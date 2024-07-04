import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.dataItem, super.key});

  final Map<String, Object> dataItem;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        dataItem['correct_answer'] == dataItem['user_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            questionIndex: dataItem['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataItem['question'] as String,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dataItem['user_answer'] as String,
                style: const TextStyle(
                    color: Color.fromARGB(255, 202, 171, 252),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dataItem['correct_answer'] as String,
                style: const TextStyle(
                    color: Color.fromARGB(255, 181, 254, 246),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
