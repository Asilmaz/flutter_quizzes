import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson27/main.dart';
import '../../app_bar.dart';

class Lesson26 extends StatefulWidget {
  const Lesson26({super.key});

  @override
  State<Lesson26> createState() => _Lesson26();
}

class _Lesson26 extends State<Lesson26> {
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
                  "Lesson 26",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Financial Metrics Of crypto",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 20),
                keyVocabulary(
                  context,
                  "Market Capitalization:",
                  "Market capitalization, or market cap, is the total value of all coins or tokens in circulation for a specific cryptocurrency. It's calculated by multiplying the current price per coin by the total number of coins in circulation. Market cap is used to measure a cryptocurrency’s size and market presence.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Volume:",
                  "Volume measures the total number of coins or tokens traded in a specific period, usually within 24 hours. A high trading volume suggests strong market interest and liquidity, while low volume can indicate low interest and liquidity.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Circulating Supply:",
                  "Circulating supply refers to the total number of cryptocurrency units that are currently available and circulating in the market. It excludes coins that have been burned, locked, or are otherwise unavailable for trading.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Liquidity:",
                  "Liquidity refers to how easily an asset can be converted into cash without significantly affecting its price. In cryptocurrencies, liquidity is essential for trading and price stability, with more liquid assets being easier to buy or sell quickly.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Fully Diluted Valuation:",
                  "Fully diluted valuation (FDV) represents the potential market capitalization of a cryptocurrency assuming all possible tokens or coins are in circulation. This metric is calculated by multiplying the total supply (maximum supply) by the current price per coin. FDV provides an estimate of the total potential value of a cryptocurrency if all its tokens are fully issued and circulating.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 4,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Total Supply:",
                  "Total supply is the number of coins or tokens that exist and are either in circulation or locked/unavailable for some reason. It includes coins that are currently locked in smart contracts, held by the project team for vesting, or otherwise restricted but excludes coins that have been burned or permanently removed from circulation.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Maximum Supply:",
                  "Maximum supply is the total number of coins or tokens that will ever be created for a specific cryptocurrency. It is a fixed limit set by the cryptocurrency’s code or protocol and cannot be exceeded. For example, Bitcoin has a maximum supply of 21 million coins.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 6,
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

                        saveResult(26, score);
                        saveResult(10026, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              26,
                              "Financial Metrics Of crypto",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson27(),
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
