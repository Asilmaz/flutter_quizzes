import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson21/main.dart';
import '../../app_bar.dart';

class Lesson20 extends StatefulWidget {
  const Lesson20({super.key});

  @override
  State<Lesson20> createState() => _Lesson20();
}

class _Lesson20 extends State<Lesson20> {
  int selectedOption = -1;
  DateTime beginTime = DateTime.now();

  @override
  void initState() {
    setState(() {
      beginTime = DateTime.now();
    });
    super.initState();
  }

  Widget buildQuizScreen({
    required int questionNumber,
    String? image,
    Widget? imageWidget,
  }) {
    List<String> answers = questions[questionNumber]["answers"] as List<String>;
    InkWell createListTitle(int val, String text, Size size) {
      return InkWell(
        onTap: usersAnswers[questionNumber] == -1 ? () {
          setState(() {
            usersAnswers[questionNumber] = val;
          });
        } : () {},
        child: ListTile(
          dense: true,
          title: Text(
            text,
            style: TextStyle(fontSize: 0.02 * size.height),
          ),
          leading: createDot(
            context,
            usersAnswers[questionNumber],
            questions[questionNumber]["correctAnswer"]!,
            val,
          ),
        ),
      );
    }

    return createExercise(
      context,
      questionNumber,
      questions[questionNumber]["question"] as String,
      answers,
      image,
      imageWidget,
      createListTitle,
      (questions[questionNumber]["explanation"] != null &&
              usersAnswers[questionNumber] != -1)
          ? questions[questionNumber]["explanation"] as String
          : null,
    );
  }

  List<int> usersAnswers = List<int>.filled(questions.length, -1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: appBar(context, ""),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: size.width / 10,
              right: size.width / 10,
              bottom: size.height / 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lesson 20",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Final knowledge quiz",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 4,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 6,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 7,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 8,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 9,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 10,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 11,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 12,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 13,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 14,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 15,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 16,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 17,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 18,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 19,
                ),
                SizedBox(height: size.height / 10),
                Center(
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: RedirectButton(
                      //route: const Lesson2(),
                      onClick: () {
                        int score = 0;
                        for (int i = 0; i < usersAnswers.length; i++) {
                          if (usersAnswers[i] ==
                              questions[i]["correctAnswer"]) {
                            score++;
                          }
                        }

                        saveResult(20, score);
                        saveResult(10020, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              20,
                              "Final knowledge quiz",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson21(),
                            ),
                          ),
                        );
                      },
                      text: 'Continue',
                      width: size.width,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
