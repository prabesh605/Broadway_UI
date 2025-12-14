class Question {
  final String question;
  final bool value;
  Question({required this.question, required this.value});
}

class QuizBrain {
  int questionNumber = 0;
  void nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
  }

  String getQuestion() {
    return questionBank[questionNumber].question;
  }

  bool getCorrectAnswer() {
    return questionBank[questionNumber].value;
  }

  bool isFinished() {
    if (questionNumber >= questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionNumber = 0;
  }

  List<Question> questionBank = [
    Question(
      question: 'The Great Wall of China is visible from space.',
      value: false,
    ),
    Question(question: 'An octopus has three hearts.', value: true),
    Question(
      question: 'Mount Everest is the tallest mountain on Earth.',
      value: true,
    ),
    Question(
      question: 'The Pacific Ocean is the largest ocean on Earth.',
      value: true,
    ),
    Question(question: 'A light year is a unit of time.', value: false),
    Question(question: 'The moon is a planet.', value: false),
    Question(
      question: 'The longest river in the world is the Nile.',
      value: false,
    ),
    Question(
      question: 'Venus is the hottest planet in the solar system.',
      value: true,
    ),
    Question(question: 'Wolves are a type of domestic dog.', value: false),
    Question(
      question: 'A diamond is the hardest natural substance on Earth.',
      value: true,
    ),
    Question(
      question: 'Humans share 60% of their DNA with bananas.',
      value: true,
    ),
    Question(
      question: 'The heart pumps blood to the lungs for oxygenation.',
      value: true,
    ),
    Question(
      question: 'Lightning never strikes the same place twice.',
      value: false,
    ),
    Question(
      question: 'Pluto is still considered a planet in the solar system.',
      value: false,
    ),
    Question(
      question: 'The Amazon Rainforest is the largest rainforest in the world.',
      value: true,
    ),
    Question(question: 'Gold is heavier than lead.', value: false),
  ];
}
