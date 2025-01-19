import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import './sats_question.dart';
import './sats_question_difficulty.dart';
import './sats_question_types_rw.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SatsQuestionBank {
  // static const String serverHost = "10.0.2.2";
  // static const String serverHost = "192.168.1.123";
  static const String serverHost = "terrasat.pl";
  // static const String serverHost = "192.168.1.19";

  // static const int serverPort = 8080;
  static const int serverPort = 11537;

  late SharedPreferences prefs;

  final String category = "rw";

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<List<String>> getQuestionListFromAssets(
      SatsQuestionSubcategoriesRW questionSubcategory,
      ) async {
    String questionIdsStr = await rootBundle.loadString('assets/sats/questions/$category/${questionSubcategory.string}/${questionSubcategory.embedQuestionName()}_list.txt', cache: false);
    return questionIdsStr.split(",,");
  }

  Future<void> loadFromAssets(
    SatsQuestionSubcategoriesRW questionSubcategory, {
      int? limit,
  }) async {
    try {
      List<String> questionIds = await getQuestionListFromAssets(questionSubcategory);
      // print('embed ids: $questionIds');
      List<String> savedQuestionIds = getSavedQuestionIds(questionSubcategory);

      int updatedCount = 0;
      for (String id in questionIds) {
        if (savedQuestionIds.contains(id)) {
          continue;
        }
        String questionStr = await rootBundle.loadString('assets/sats/questions/$category/${questionSubcategory.string}/$id', cache: false);
        SatsQuestion question = SatsQuestion.fromJsonDifficulty(jsonDecode(questionStr), SatsQuestionDifficulty.difficultyEasy);
        question.subcategory = questionSubcategory;
        await setSavedQuestion(question, questionSubcategory, id);
        savedQuestionIds.add(id);
        if (limit != null && ++updatedCount >= limit) {
          break;
        }
      }
      await setSavedQuestionIds(questionSubcategory, savedQuestionIds);
    } catch (error) {
      print("loadFromAssets(${questionSubcategory.string}) error: $error");
    }
  }

  Future<List<String>?> getQuestionListFromBackend(
    SatsQuestionSubcategoriesRW questionSubcategory,
  ) async {
    try {
      Response response = await get(
        Uri(scheme: 'http', host: serverHost, port: serverPort),
        headers: {
          "brainace": ".pro",
          "data-type": "question-list",
          "category": category,
          "subcategory": questionSubcategory.string,
        },
      ).timeout(Duration(seconds: 5));
      if (response.body == "") {
        return null;
      }
      List<String> questionIds = response.body.split(",,");
      return questionIds.isEmpty ? null : questionIds;
    } catch (error) {
      print("getQuestionListFromBackend(${questionSubcategory.string}) error: $error");
      return null;
    }
  }

  Future<SatsQuestion?> getQuestionFromBackend(
    SatsQuestionSubcategoriesRW questionSubcategory,
    String id,
  ) async {
    try {
      Response response = await get(
        Uri(scheme: 'http', host: serverHost, port: serverPort),
        headers: {
          "brainace": ".pro",
          "data-type": "question-get",
          "category": category,
          "subcategory": questionSubcategory.string,
          "question-id": id,
        },
      );
      // print("Question $id: ${response.body}");
      if (response.body == "") {
        return null;
      }
      SatsQuestion question = SatsQuestion.fromJsonDifficulty(jsonDecode(response.body), SatsQuestionDifficulty.fromContainingString(id));
      question.subcategory = questionSubcategory;
      return question;
    } catch (error) {
      print("getQuestionFromBackend(${questionSubcategory.string}) error: $error");
      return null;
    }
  }

  List<String> getSavedQuestionIds(
    SatsQuestionSubcategoriesRW questionSubcategory,
  ) {
    String questionIds = prefs.getString('questions_${category}_${questionSubcategory.string}_list') ?? "";
    return questionIds == "" ? [] : questionIds.split(",,");
  }

  Future<void> setSavedQuestionIds(SatsQuestionSubcategoriesRW questionSubcategory, List<String> questionIds) async {
    await prefs.setString('questions_${category}_${questionSubcategory.string}_list', questionIds.join(",,"));
  }

  List<String> getUsedQuestionsIds(SatsQuestionSubcategoriesRW questionSubcategory) {
    if (prefs.getString('questions_${category}_${questionSubcategory}_used') == null) {
      return [];
    }
    return prefs.getString('questions_${category}_${questionSubcategory}_used')!.split(",,");
  }

  Future<void> setUsedQuestionsIds(SatsQuestionSubcategoriesRW questionSubcategory, List<String> usedQuestionIds) async {
    await prefs.setString('questions_${category}_${questionSubcategory}_used', usedQuestionIds.join(",,"));
  }

  Future<void> setSavedQuestion(
    SatsQuestion question,
    SatsQuestionSubcategoriesRW questionSubcategory,
    String questionID,
  ) async {
    await prefs.setString('questions_${category}_${questionSubcategory.string}_$questionID', question.toJson());
  }

  SatsQuestion? getSavedQuestion(
    SatsQuestionSubcategoriesRW questionSubcategory,
    String questionID,
  ) {
    String? savedQuestion = prefs.getString('questions_${category}_${questionSubcategory.string}_$questionID');
    if (savedQuestion == null) {
      return null;
    }
    return SatsQuestion.fromJson(jsonDecode(savedQuestion));
  }

  Future<bool> updateQuestionsFromBackend(
    SatsQuestionSubcategoriesRW questionSubcategory, {
    int? limit,
  }) async {
    List<String>? fetchedQuestionIdList = await getQuestionListFromBackend(questionSubcategory);
    print("fetchedQuestionIdList: $fetchedQuestionIdList");
    if (fetchedQuestionIdList == null) {
      return false;
    }
    List<String> savedQuestionIds = getSavedQuestionIds(questionSubcategory);
    // print("savedQuestionIds: ${savedQuestionIds}");

    int updatedCount = 0;
    for (String id in fetchedQuestionIdList) {
      if (savedQuestionIds.contains(id)) {
        continue;
      }
      SatsQuestion? question = await getQuestionFromBackend(questionSubcategory, id);
      if (question == null) {
        continue;
      }
      await setSavedQuestion(question, questionSubcategory, id);
      savedQuestionIds.add(id);
      if (limit != null && ++updatedCount >= limit) {
        break;
      }
    }
    await setSavedQuestionIds(questionSubcategory, savedQuestionIds);
    print("Updated questions.");
    // } catch (e) {
    //   print("Failed to update questions: $e");
    // }
    return true;
  }

  Future<bool> updateQuestions(
    SatsQuestionSubcategoriesRW questionSubcategory, {
    int? limit,
    }) async {
    print("Updating questions for ${questionSubcategory.string}.");
    await loadFromAssets(questionSubcategory, limit: limit);
    return await updateQuestionsFromBackend(questionSubcategory, limit: limit);
  }

  Future<Map<String, SatsQuestion>> getQuestions(
    SatsQuestionSubcategoriesRW questionSubcategory,
    int limit,
    bool markAsUsed,
    bool avoidUsed, {
      SatsQuestionDifficulty? difficulty,
  }) async {
    List<String> questionIds = getSavedQuestionIds(questionSubcategory);
    if (questionIds.isEmpty) {
      return {};
    }
    List<String> usedQuestionIds = getUsedQuestionsIds(questionSubcategory);
    // print("QuestionIds: $questionIds");
    // print("UsedQuestionIds: $usedQuestionIds");

    Map<String, SatsQuestion> questions = {};
    for (var id in questionIds) {
      if (questions.length >= limit) {
        break;
      }
      if (usedQuestionIds.length >= questionIds.length) {
        usedQuestionIds = [];
      }
      if (avoidUsed && usedQuestionIds.contains(id)) {
        continue;
      }
      SatsQuestion? question = getSavedQuestion(questionSubcategory, id);
      if (question == null) {
        continue;
      }
      if (difficulty != null && question.difficulty != difficulty) {
        continue;
      }
      questions[id] = question;
      if (markAsUsed) {
        usedQuestionIds.add(id);
      }
    }
    if (markAsUsed) {
      await setUsedQuestionsIds(questionSubcategory, usedQuestionIds);
    }
    if (questions.length < limit) {
      print("Using questions from other difficulty levels. ${questionSubcategory.string}");
      questions.addAll(await getQuestions(questionSubcategory, limit - questions.length, markAsUsed, avoidUsed));
    }
    return questions;
  }

  Future<void> reportQuestion(
      SatsQuestionSubcategoriesRW questionSubcategory,
      String questionID,
      ) async {
    await post(Uri(scheme: 'http', host: serverHost, port: serverPort),
      headers: {
        "brainace": ".pro",
        "data-type": "question-report",
        "category": category,
        "subcategory": questionSubcategory.string,
        "question-id": questionID,
      },
    );
  }
}
