import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson17/main.dart';
import '../../app_bar.dart';

class Lesson16 extends StatefulWidget {
  const Lesson16({super.key});

  @override
  State<Lesson16> createState() => _Lesson16();
}

class _Lesson16 extends State<Lesson16> {
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
                  "Lesson 16",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "What are ETFs ?",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                //SizedBox(height: size.height / 60),
                createDivider(context),
                Text(
                  "An Exchange-Traded Fund (ETF) is a type of investment fund that, like a stock, is traded on stock exchanges. It holds a collection of assets, which might include stocks, bonds, or commodities, depending on the fund's focus. For instance, an ETF might track the S&P 500 index, meaning it holds stocks from the top 500 companies in the U.S., giving investors broad market exposure through one security. Some ETFs focus on specific sectors like technology or healthcare, while others may follow commodities such as gold. One of the main benefits of investing in ETFs is diversification—owning a broad selection of assets—which reduces risk. Additionally, ETFs offer the flexibility of trading throughout the day, much like stocks, as opposed to mutual funds which are only priced once daily.",
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
                  "ETFs can be passively or actively managed. Passively managed ETFs aim to replicate the performance of an index, like the S&P 500, with minimal management intervention, keeping costs low. Actively managed ETFs, on the other hand, have portfolio managers making buying and selling decisions to try to beat a benchmark index, which can result in higher fees due to more frequent trading. Regardless of the management style, ETFs usually have lower expense ratios than mutual funds, making them a cost-effective choice for many investors.",
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
                  "ETFs provide diversification by holding a basket of assets within a single security. This reduces the risk associated with investing in individual stocks or bonds. However, tracking errors can occur, meaning an ETF's performance might not perfectly match the index it tracks due to fees and other factors. Liquidity can also vary, and less liquid ETFs can have wider spreads between the bid and ask prices, impacting trading efficiency.",
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
                  "ETFs can be an efficient way to gain exposure to various markets or asset classes, such as international stocks, specific sectors, or commodities. However, not all ETFs are structured the same. Some use leverage, borrowing funds to increase investment exposure, aiming to amplify returns. This leverage also increases potential losses, adding risk and complexity to the investment.",
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
                  "In terms of tax efficiency, ETFs generally have an advantage over mutual funds due to their \"in-kind\" creation and redemption mechanism. This means that when investors buy or sell ETFs, the underlying securities are swapped directly rather than liquidated for cash, thus avoiding taxable events. This structure allows ETFs to minimize taxable events and reduce capital gains distributions compared to mutual funds, which frequently have internal trading that can trigger taxes for shareholders.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
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

                        saveResult(16, score);
                        saveResult(10016, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              16,
                              "What are ETFs ?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson17(),
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
