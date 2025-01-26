import 'package:flutter_quizzes/flutter_quizzes.dart';
import 'package:flutter_bta_functions/flutter_bta_functions.dart';

Future<Map<String, QuizQuestionData>> convertToQuestions(Map<String, dynamic> tasks) async {
  Map<String, QuizQuestionData> questions = {
    for (int i = 0; i < tasks.length; ++i)
      "$i": await () async {
        String id = tasks.keys.elementAt(i);
        Map<String, String> answers = {
          for (var key in tasks[id]["answers"].keys)
            key: tasks[id]["answers"][key]["text"].toString(),
        };
        Map<String, bool> correct = {
          for (var key in tasks[id]["answers"].keys)
            key: tasks[id]["answers"][key]["correct"] as bool,
        };
        return QuizQuestionData(
          answers,
          correct,
          {
            for (var key in tasks[id]["answers"].keys)
              key: 1,
          },
          question: "${tasks[id]["task"]}",
        );
      }(),
  };
  return questions;
}

Future<Map<String, QuizQuestionData>> convertToRandomQuestions(String category, String level, int count) async {
  Map<String, dynamic> tasks = await getRandomQuestions(category, level, count);
  return convertToQuestions(tasks);
}

class QuizQuestionData {
  String? introduction;
  String? text;
  String? text2;
  String question;
  Map<String, String> answers;
  Map<String, bool> correct;
  Map<String, double> score;
  Map<String, double?>? scoreIncorrect;

  /// Mainly for SATs
  String? explanation;
  SatsQuestionSubcategoriesRW? subcategory;
  SatsQuestionDifficulty? difficulty;


  QuizQuestionData(
    this.answers,
    this.correct,
    this.score, {
    this.introduction,
    this.text,
    this.text2,
    required this.question,
    this.scoreIncorrect,
    this.explanation,
    this.subcategory,
    this.difficulty,
  });
}
