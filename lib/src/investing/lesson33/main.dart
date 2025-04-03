import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson34/main.dart';
import '../../app_bar.dart';

class Lesson33 extends StatefulWidget {
  const Lesson33({super.key});

  @override
  State<Lesson33> createState() => _Lesson33();
}

class _Lesson33 extends State<Lesson33> {
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
                  "Lesson 33",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Harder Quiz",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "Certainly! Here is a 20-question multiple-choice quiz based on the lessons you provided:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                createDivider(context),
                Text(
                  "Cryptocurrencies",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 0),
                createDivider(context),
                Text(
                  "Blockchain",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 1),
                createDivider(context),
                Text(
                  "Miners",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 2),
                createDivider(context),
                Text(
                  "Crypto Security",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 3),
                createDivider(context),
                Text(
                  "Crypto Transactions",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 4),
                createDivider(context),
                Text(
                  "Why Do Cryptocurrencies Have Value?",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 5),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 6),
                createDivider(context),
                Text(
                  "Technical Analysis (TA)",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 7),
                createDivider(context),
                Text(
                  "Wallet Security",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 8),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 9),
                createDivider(context),
                Text(
                  "Fundamental Analysis Questions",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 10),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 11),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 12),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 13),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 14),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 15),
                createDivider(context),
                Text(
                  "Technical Analysis Questions",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 16),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 17),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 18),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 19),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 20),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 21),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 22),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 23),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 24),
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

                        saveResult(33, score);
                        saveResult(10033, score);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              33,
                              "Harder Quiz",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson34(),
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
