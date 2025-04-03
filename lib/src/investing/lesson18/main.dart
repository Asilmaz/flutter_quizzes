import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson19/main.dart';
import '../../app_bar.dart';

class Lesson18 extends StatefulWidget {
  const Lesson18({super.key});

  @override
  State<Lesson18> createState() => _Lesson18();
}

class _Lesson18 extends State<Lesson18> {
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
                  "Lesson 18",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Shorting, Leverage",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                createDivider(context),
                Text(
                  "ETFs come in various types, each catering to different investment goals and strategies. Below is an overview of the different types of ETFs, followed by some questions to test understanding.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Short Selling",
                  "is an investment strategy where an investor borrows shares of a stock they believe will decline in value and sells them on the open market. The idea is to repurchase these shares later at a lower price, return them to the lender, and pocket the difference as profit. For example, if an investor borrows 100 shares at \$10 each, sells them for \$1,000, and later buys them back at \$7 each, they can make a \$300 profit after returning the borrowed shares. However, if the stock price rises instead, the investor would face losses, as they still need to buy back the shares to return them.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Buying with Leverage",
                  "means using borrowed funds to increase the potential returns of an investment. In simple terms, it’s like taking a loan to invest in stocks, real estate, or other assets. For instance, if an investor has \$1,000 and wants to buy \$2,000 worth of stock, they can borrow \$1,000 from a broker. If the stock’s price rises, the investor can make significant profits because their initial investment was amplified by the borrowed money. However, leverage also amplifies losses, making it a risky strategy that could lead to significant losses if the investment's value decreases.",
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
                  questionNumber: 4,
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

                        saveResult(18, score);
                        saveResult(10018, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              18,
                              "Shorting, Leverage",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson19(),
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
