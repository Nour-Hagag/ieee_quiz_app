class QuizQuestions {
  final String question;
  final List<String> answers;
  // final int answerIndex;
  QuizQuestions({
    required this.question,
    required this.answers,
    // required this.answerIndex,
  });
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
