import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson8/main.dart';
import '../../app_bar.dart';

class Lesson7 extends StatefulWidget {
  const Lesson7({super.key});

  @override
  State<Lesson7> createState() => _Lesson7();
}

class _Lesson7 extends State<Lesson7> {
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
                  "Lesson 7",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Key Financial Metrics part 2",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 60),
                keyVocabulary(
                  context,
                  "Dividends",
                  "Dividends are payments made by a company to its shareholders, usually as a reward for investing. Think of it like getting a small bonus for being a part-owner of the company. Dividends can be paid in cash or additional shares.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Dividend Yield",
                  "Dividend yield shows the annual dividend payout as a percentage of the stock’s price. It’s calculated by dividing the annual dividends by the stock’s market price. It helps investors understand how much income they might earn from dividends relative to the stock price.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Return on Assets (ROA)",
                  "ROA measures how efficiently a company uses its assets to generate profits. You calculate it by dividing net income by total assets. A higher ROA suggests the company is effective in using its assets to make money.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Return on Equity (ROE)",
                  "ROE measures how effectively a company uses shareholder funds to generate profits. You calculate it by dividing net income by shareholders' equity. A high ROE indicates the company is efficiently using investor capital.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Revenue",
                  "Revenue is the total amount of money a company makes from its main business activities, like selling products or services, before any expenses are deducted. It’s often called the \"top line\" since it’s at the top of the income statement.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 4,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Earnings",
                  "Earnings refer to a company's profit after all expenses are deducted from its revenue. It’s often called the \"bottom line\" since it’s the last line on the income statement.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Quarterly Revenue Growth",
                  "Quarterly revenue growth shows the percentage increase (or decrease) in revenue compared to the same quarter of the previous year. It helps investors gauge how quickly a company’s sales are growing.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 6,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Quarterly Earnings Growth",
                  "Quarterly earnings growth shows the percentage change in profits compared to the same quarter last year. It helps investors understand if the company’s profits are growing over time.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 7,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Total Cash Per Share",
                  "Total cash per share is the total amount of cash a company has, divided by the number of shares outstanding. It gives investors an idea of the cash available for each share.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 8,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Total Debt/Equity",
                  "Total debt/equity ratio compares a company’s total debt to its shareholders’ equity. It shows how much debt the company has relative to the money invested by its shareholders. A lower ratio generally indicates a company with lower financial risk.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 9,
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

                        saveResult(7, score);
                        saveResult(10007, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              7,
                              "Key Financial Metrics part 2",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson8(),
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
