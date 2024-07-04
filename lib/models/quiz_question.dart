class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getSuffledList() {
    final List<String> suffledAnsers = List.of(answers);
    suffledAnsers.shuffle();
    return suffledAnsers;
  }
}
