import 'package:flutter/material.dart';
import 'package:second_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, this.chosenAnswers, {super.key});

  final List<Map<String, Object>> summaryData;
  final List chosenAnswers;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
          child: Column(
              children: summaryData.map((data) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SummaryItem(
            dataItem: data,
          ),
        );
      }).toList())),
    );
  }
}

// [
//               Text(
//                 summaryData()[init]['question_index'].toString(),
//                 style: const TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               Text(
//                 summaryData()[init]['question'].toString(),
//                 style: const TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               Text(
//                 summaryData()[init]['correct_answer'].toString(),
//                 style: const TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               Text(
//                 summaryData()[init]['user_answer'].toString(),
//                 style: const TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ],
