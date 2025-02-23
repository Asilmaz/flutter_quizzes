import 'dart:convert';
import './sats_question_difficulty.dart';
import './sats_question_types_rw.dart';

class SatsQuestion {
  final String? introduction;
  final String? text;
  final String? text2;
  final String question; // json of the question - divided into parts for text formatting
  final String A;
  final String B;
  final String C;
  final String D;
  final String correct;
  final String explanation;
  late SatsQuestionSubcategories? subcategory; // check if late final is OK here
  final SatsQuestionDifficulty difficulty;

  SatsQuestion(this.introduction, this.text, this.text2, this.question, this.A, this.B, this.C, this.D, this.correct, this.explanation, this.subcategory, this.difficulty,
      );

  SatsQuestion.fromJson(Map<String, dynamic> json)
      : introduction = json['introduction'] as String?,
        text = json['text'] as String?,
        text2 = json['text2'] as String?,
        question = json['question'] as String,
        A = json['A'] as String,
        B = json['B'] as String,
        C = json['C'] as String,
        D = json['D'] as String,
        correct = json['correct'] as String,
        explanation = json['explanation'] as String,
        subcategory = json['subcategory'] == null ? null : SatsQuestionSubcategories.fromString(json['subcategory'] as String),
        difficulty = SatsQuestionDifficulty.fromString(json['difficulty']);

  SatsQuestion.fromJsonDifficulty(Map<String, dynamic> json, this.difficulty)
      : introduction = json['introduction'] as String?,
        text = json['text'] as String?,
        text2 = json['text2'] as String?,
        question = json['question'] as String,
        A = json['A'] as String,
        B = json['B'] as String,
        C = json['C'] as String,
        D = json['D'] as String,
        correct = json['correct'] as String,
        explanation = json['explanation'] as String,
        subcategory = json['subcategory'] == null ? null : SatsQuestionSubcategories.fromString(json['subcategory'] as String);

  String toJson() {
    Map<String, dynamic> json = {
      'introduction': introduction,
      'text': text,
      'text2': text2,
      'question': question,
      'A': A,
      'B': B,
      'C': C,
      'D': D,
      'correct': correct,
      'explanation': explanation,
      'subcategory': subcategory?.string,
      'difficulty': difficulty.string,
    };
    return jsonEncode(json);
  }

  String getAnswer(String answerLetter) {
    if (answerLetter == 'A') {
      return A;
    } else if (answerLetter == 'B') {
      return B;
    } else if (answerLetter == 'C') {
      return C;
    } else if (answerLetter == 'D') {
      return D;
    }
    throw Exception('Invalid answer letter');
  }
}
