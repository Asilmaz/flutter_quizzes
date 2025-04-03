import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson7/main.dart';
import '../../app_bar.dart';

class Lesson6 extends StatefulWidget {
  const Lesson6({super.key});

  @override
  State<Lesson6> createState() => _Lesson6();
}

class _Lesson6 extends State<Lesson6> {
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
                  "Lesson 6",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Key Financial Metrics",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Book Value:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Think of book value as the total value of everything a company owns (like buildings, cash, and equipment) minus everything it owes (like loans or unpaid bills). This tells us the net worth of the company. If you divide this value by the number of shares, you get the book value per share.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                createDivider(context),
                //SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                Text(
                  "Market Price:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Market price is the current price at which you can buy or sell a company's stock on the stock market. This price changes throughout the day as people buy and sell.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                createDivider(context),
                Text(
                  "Price/Book (P/B) Ratio:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "The P/B ratio shows how the market price compares to the company's book value. You get this by dividing the market price by the book value per share. If the ratio is low, it might mean the stock is undervalued or that the company is having trouble.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                Text(
                  "Earnings:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Earnings are the profits a company makes over a set period, usually every three months (quarterly) or every year. It shows how much money the company made after paying all its expenses.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                Text(
                  "Price/Earnings (P/E) Ratio:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "The P/E ratio compares a company's market price to its earnings per share. You calculate it by dividing the market price by the earnings per share. A high P/E ratio could mean that the stock is overvalued or that people expect the company to grow in the future.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 4,
                ),
                createDivider(context),
                Text(
                  "EBITDA (Earnings Before Interest, Taxes, Depreciation, and Amortization):",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "EBITDA is a measure of a company’s profitability before certain expenses are considered. It helps show how much money the company makes from its main business operations.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                createDivider(context),
                Text(
                  "Enterprise Value/EBITDA (EV/EBITDA):",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "The EV/EBITDA ratio shows how much a company is worth compared to its EBITDA. You calculate it by dividing the company’s total value (enterprise value) by its EBITDA. A lower ratio can mean the company is undervalued.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 6,
                ),
                createDivider(context),
                Text(
                  "Beta:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Beta measures how much a stock’s price moves compared to the overall market. If a stock’s beta is 1, it moves with the market. If it’s less than 1, it’s less volatile, and if it’s above 1, it’s more volatile.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 2,
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

                        saveResult(6, score);
                        saveResult(10006, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              6,
                              "Key Financial Metrics",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson7(),
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
