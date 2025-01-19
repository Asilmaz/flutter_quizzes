import './sats_question_bank.dart';
import './sats_question_types_rw.dart';
import 'package:flutter/material.dart';

Future<void> ReportQuestionDialog(
    BuildContext context,
    SatsQuestionSubcategoriesRW? questionSubcategory,
    String? questionID,
    ) async {
  Size size = MediaQuery.of(context).size;
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        scrollable: true,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Would you like to report this question?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width / 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height / 50),
                Text(
                  textAlign: TextAlign.center,
                  "Please report any questions if you believe they contain a mistake or are too far from the SAT-style questions.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width / 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: SizedBox(
                  width: size.width / 8,
                  child: Center(
                    child: Text(
                      "No",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    SatsQuestionBank questionBank = SatsQuestionBank();
                    if (questionSubcategory != null && questionID != null) {
                      questionBank.reportQuestion(questionSubcategory, questionID);
                    }
                  } catch (e) {
                    print("Error reporting question: $e");
                  }
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: SizedBox(
                  width: size.width / 8,
                  child: Center(
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}