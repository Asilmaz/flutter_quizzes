import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson11/main.dart';
import '../../app_bar.dart';

class Lesson10 extends StatefulWidget {
  const Lesson10({super.key});

  @override
  State<Lesson10> createState() => _Lesson10();
}

class _Lesson10 extends State<Lesson10> {
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
                  "Lesson 10",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "How to choose a stock ?",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                createDivider(context),
                Text(
                  "Step 1: Define Your Investment Goals",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Determine why you want to invest in stocks. Are you looking for long-term growth, dividend income, or a mix of both? Understanding your goals helps you choose the right stocks that align with your investment strategy.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                Text(
                  "Step 2: Research and Understand the Industry",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Analyze the industry to understand its trends, competition, and challenges. Are you interested in technology, healthcare, or consumer goods? Knowing the industry well will help you identify opportunities and risks associated with the companies operating in it.",
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
                  "Step 3: Analyze Company Fundamentals",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Look into the company's financial health by analyzing key metrics such as revenue, earnings, cash flow, and debt. Check the company's earnings reports, balance sheets, and cash flow statements to evaluate its financial stability.",
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
                  "Step 4: Evaluate Key Financial Ratios",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Examine financial ratios to assess a company's performance:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 60),
                keyVocabulary(
                  context,
                  " - P/E Ratio",
                  "Indicates valuation based on earnings. A high P/E ratio might suggest overvaluation.",
                ),
                SizedBox(height: size.height / 60),
                keyVocabulary(
                  context,
                  " - P/B Ratio",
                  "Shows market value relative to book value. A lower ratio can signal undervaluation.",
                ),
                SizedBox(height: size.height / 60),
                keyVocabulary(
                  context,
                  " - Debt/Equity Ratio",
                  "Assesses the company’s leverage. A lower ratio suggests less financial risk.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                Text(
                  "Step 5: Consider Dividend Yield",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "If you seek income, focus on companies with a stable history of dividend payments. Check the dividend yield to understand the income potential compared to the stock's price.",
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
                  "Step 6: Assess Growth Prospects",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Evaluate the company's potential for future growth by considering factors like quarterly earnings growth, revenue growth, and expansion plans.",
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
                  "Step 7: Evaluate Risk and Volatility (Beta)",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Check the beta of the stock to understand its volatility compared to the market. A high beta suggests the stock is more volatile, which might be suitable for risk-tolerant investors.",
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
                  "Step 8: Diversify Your Portfolio",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Don't put all your eggs in one basket. Invest across different industries and asset classes to reduce risk.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 7,
                ),
                createDivider(context),
                Text(
                  "Conclusion",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "By following this structured approach, you can make informed decisions when selecting stocks for your investment portfolio. Assessing your goals, understanding industry trends, and analyzing company fundamentals will help you choose stocks that align with your strategy and risk tolerance.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
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

                        saveResult(10, score);
                        saveResult(10010, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              10,
                              "How to choose a stock ?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson11(),
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
