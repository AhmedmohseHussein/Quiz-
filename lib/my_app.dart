import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/question_screen.dart';
import 'package:second_app/results_screen.dart';
import 'package:second_app/start_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> selectedAnswers = [];

  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : activeScreen == 'results-screen'
            ? ResultsScreen(
                switchScreen,
                chosenAnswers: selectedAnswers,
              )
            : QuestionsScreen(onSelectedAnswer: chooseAnswer);
    // Widget screenWidget = StartScreen(switchScreen);
    // switch (activeScreen) {
    //   case 'start-screen':
    //     screenWidget = StartScreen(switchScreen);
    //     break;
    //   case 'questions-screen':
    //     screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    //     break;
    //   case 'results-screen':
    //     screenWidget = ResultsScreen(switchScreen);
    //     break;
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ])),
          child: screenWidget,
        ),
      ),
    );
  }
}

// drive between sceens function

// Widget? choesScreen() {
//     Widget? theScreen;
//     if (activeScreen == 'start-screen') {
//       theScreen = StartScreen(switchScreen);
//     } else {
//       theScreen = const QuestionsScreen();
//     }
//     return theScreen;
//   }

// if (activeScreen == 'questions-screen') {
//       screenWidget = const QuestionsScreen();
//     }
