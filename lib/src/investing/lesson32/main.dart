import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson33/main.dart';
import '../../app_bar.dart';

class Lesson32 extends StatefulWidget {
  const Lesson32({super.key});

  @override
  State<Lesson32> createState() => _Lesson32();
}

class _Lesson32 extends State<Lesson32> {
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
                  "Lesson 32",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Final Knowledge Quiz",
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
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 1),
                createDivider(context),
                Text(
                  "Blockchain",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 2),
                createDivider(context),
                Text(
                  "Miners",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 3),
                createDivider(context),
                Text(
                  "Crypto Security",
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
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 8),
                createDivider(context),
                Text(
                  "Candlestick Charts",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 9),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 10),
                createDivider(context),
                Text(
                  "Market Capitalization",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 11),
                createDivider(context),
                Text(
                  "Volume",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 12),
                createDivider(context),
                Text(
                  "Circulating Supply",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 13),
                createDivider(context),
                Text(
                  "Fully Diluted Valuation",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 14),
                createDivider(context),
                Text(
                  "Maximum Supply",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(questionNumber: 15),
                createDivider(context),
                Text(
                  "Wallet Security",
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

                        saveResult(32, score);
                        saveResult(10032, score);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              32,
                              "Final Knowledge Quiz",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson33(),
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
