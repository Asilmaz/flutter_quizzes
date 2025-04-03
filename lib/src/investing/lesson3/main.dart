import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson4/main.dart';
import '../../app_bar.dart';

class Lesson3 extends StatefulWidget {
  const Lesson3({super.key});

  @override
  State<Lesson3> createState() => _Lesson3();
}

class _Lesson3 extends State<Lesson3> {
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
                  "Lesson 3",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Is investing really gambling?",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "One of the reactions you will often receive, when telling others (especially the older generations) you would like to start investing is that you are “acting stupid, just gambling, and going to lose all your money”. Well, let’s now analyse these claims and see if they hold and truth.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                createDivider(context),
                Text(
                  "Key vocabulary:",
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                keyVocabulary(
                  context,
                  "Investing -",
                  "putting (money) into financial schemes, shares, property, or a commercial venture with the expectation of achieving a profit (Oxford Dictionary)",
                ),
                SizedBox(height: size.height / 50),
                keyVocabulary(
                  context,
                  "Inflation -",
                  "the increase of prices over time",
                ),
                SizedBox(height: size.height / 30),
                Text(
                  "Money, essentially worthless alone, gains value as a medium of exchange for goods and services. A \$10 bill, is worth \$10 dollars because we can buy with it sth that is 10 times more valuable than sth for \$1. Governments regulate the supply of money, often through printing more, but this doesn't create wealth. Increasing the money supply without a corresponding rise in production leads to inflation. This happens because more money chases the same goods and services. For instance, if the government doubles the money supply without boosting production, prices roughly double too. What are the consequences ? Our savings lose value over time, as we can buy less and less with it.",
                  style: TextStyle(
                    fontSize: 0.020 * size.height,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                SizedBox(height: size.height / 10),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                SizedBox(height: size.height / 10),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                Text(
                  "If you still don’t believe in the power of investing then here are three examples that should convince you in the safety of investing:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                SizedBox(height: size.height / 30),
                Text(
                  "1. If you were to buy one S&P 500 ETF in 1928 for 17.5 \$ you would have 3 951 \$ equivalent to 235 \$ today.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                SizedBox(height: size.height / 30),
                Text(
                  "2. If you  bought one share of MBG.DE 10 years ago for 40 euros, you would now have 150 euros. An increase of 350%. On the other hand, if you had kept the money under the mattress, its value would have decreased by 38%.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                SizedBox(height: size.height / 30),
                Text(
                  "3. The average stock market return is about 10% per year for nearly the last century, as measured by the S&P 500 index - meaning that it consistently grows.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                Text(
                  "Alright so now we are closing the first section of our course, and thus here is a short summary quiz for you:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "Final Quiz:",
                  style: TextStyle(
                    fontSize: size.width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 40),
                buildQuizScreen(
                  questionNumber: 4,
                ),
                SizedBox(height: size.height / 10),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                SizedBox(height: size.height / 10),
                buildQuizScreen(
                  questionNumber: 6,
                ),
                SizedBox(height: size.height / 20),
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

                        saveResult(3, score);
                        saveResult(10003, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              3,
                              "Is investing really gambling?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson4(),
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
