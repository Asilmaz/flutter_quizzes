import 'dart:convert';

import 'package:flutter_quizzes/flutter_quizzes.dart';
import 'package:flutter_bta_functions/flutter_bta_functions.dart';

Future<Map<String, QuizQuestionData>> convertToQuestions(Map<String, dynamic> tasks) async {
  Map<String, QuizQuestionData> questions = {
    for (int i = 0; i < tasks.length; ++i)
      "$i": await () async {
        String id = tasks.keys.elementAt(i);
        Map<String, dynamic> answers = {
          for (var key in tasks[id]["answers"].keys)
            key: tasks[id]["answers"][key]["text"] as dynamic,
          // key: tasks[id]["answers"][key]["text"].toString(),
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
  Map<String, dynamic> answers;
  Map<String, bool> correct;
  Map<String, double> score;
  Map<String, double?>? scoreIncorrect;
  List<List<String>> table;

  /// Mainly for SATs
  String? explanation;
  SatsQuestionSubcategories? subcategory;
  String? subcategoryStr;
  SatsQuestionDifficulty? difficulty;
  String id;

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
        this.subcategoryStr = "",
        this.difficulty,
        this.table = const [],
        this.id = '',
      });

  QuizQuestionData.fromJson(Map<String, dynamic> json)
      : introduction = json['introduction'] as String?,
        text = json['text'] as String?,
        text2 = json['text2'] as String?,
        question = (json['question'] != null ? json['question'] : json['task']) as String,
        answers = {
          for (var key in json['answers'].keys)
          // key: json['answers'][key].toString(),
            key: json['answers'][key] as dynamic,
        },
        correct = {
          for (var key in json['correct'].keys)
            key: json['correct'][key] as bool,
        },
        score = json['score'] == null ? {
          for (var key in json['answers'].keys)
            key: (json['correct'][key] ? 1.0 : 0.0) as double,
        } : {
          for (var key in json['score'].keys)
            key: json['score'][key] as double,
        },
        table = json['table'] == null ? [] : List<List<String>>.from(json['table']),
        explanation = json['explanation'] as String,
        subcategoryStr = (json['subcategory'] != null ? json['subcategory'] : json['category']) as String,
        difficulty = SatsQuestionDifficulty.fromString(json['difficulty']),
        id = (json["ID"] ?? json['id'] ?? '') as String;

  QuizQuestionData.fromJsonDifficulty(Map<String, dynamic> json, this.difficulty)
      : introduction = json['introduction'] as String?,
        text = json['text'] as String?,
        text2 = json['text2'] as String?,
        question = (json['question'] != null ? json['question'] : json['task']) as String,
        answers = {
          for (var key in json['answers'].keys)
          // key: json['answers'][key].toString(),
            key: json['answers'][key] as dynamic,
        },
        correct = {
          for (var key in json['correct'].keys)
            key: json['correct'][key] as bool,
        },
        score = json['score'] == null ? {
          for (var key in json['answers'].keys)
            key: 1,
        } : {
          for (var key in json['score'].keys)
            key: json['score'][key] as double,
        },
        table = json['table'] == null ? [] : List<List<String>>.from(json['table']),
        explanation = json['explanation'] as String,
        subcategoryStr = (json['subcategory'] != null ? json['subcategory'] : json['category']) as String,
        id = (json["ID"] ?? json['id'] ?? '') as String;

  String toJson() {
    Map<String, dynamic> json = {
      'introduction': introduction,
      'text': text,
      'text2': text2,
      'task': question,
      "answers": answers,
      "correct": correct,
      "score": score,
      "table": table,
      'explanation': explanation,
      if (subcategoryStr != null) 'subcategory': subcategoryStr,
      if (difficulty != null) 'difficulty': difficulty!.string,
      id: id,
    };
    return jsonEncode(json);
  }
}
