import 'dart:io';

// Question class
class Question {
  String questionText;
  List<String> options;
  int correctOption;

  Question(this.questionText, this.options, this.correctOption);
}

void main() {
  List<Question> questions = [
    Question('What is the capital of France?', [
      'Berlin',
      'Madrid',
      'Paris',
      'Rome',
    ], 2),
    Question('Which planet is known as the Red Planet?', [
      'Earth',
      'Mars',
      'Jupiter',
      'Venus',
    ], 1),
    Question('Who wrote "Hamlet"?', [
      'Charles Dickens',
      'William Shakespeare',
      'Leo Tolstoy',
      'Mark Twain',
    ], 1),
    Question('What is the boiling point of water?', [
      '100°C',
      '90°C',
      '80°C',
      '70°C',
    ], 0),
  ];

  int score = 0;

  print('Welcome to the Quiz!\n');

  for (int i = 0; i < questions.length; i++) {
    var question = questions[i];
    print('${i + 1}. ${question.questionText}');

    for (int j = 0; j < question.options.length; j++) {
      print('   ${j + 1}. ${question.options[j]}');
    }

    stdout.write('Enter your answer (1-${question.options.length}): ');
    String? userInput = stdin.readLineSync();

    if (userInput != null) {
      int? selectedOption = int.tryParse(userInput);
      if (selectedOption != null &&
          selectedOption - 1 == question.correctOption) {
        print('Correct!\n');
        score++;
      } else {
        print(
          'Wrong! The correct answer was: ${question.options[question.correctOption]}\n',
        );
      }
    } else {
      print('Invalid input! Moving to next question.\n');
    }
  }

  print('Quiz Completed!');
  print('Your final score is: $score/${questions.length}');
}
