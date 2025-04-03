import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson18/main.dart';
import '../../app_bar.dart';

class Lesson17 extends StatefulWidget {
  const Lesson17({super.key});

  @override
  State<Lesson17> createState() => _Lesson17();
}

class _Lesson17 extends State<Lesson17> {
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
                  "Lesson 17",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Types of ETFs",
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
                  "Broad Market ETFs",
                  "aim to track broad indexes, providing a way to invest in the entire market or significant portions of it. For example, an ETF that tracks the S&P 500 offers exposure to the 500 largest publicly traded U.S. companies. These ETFs provide diversification across sectors and industries, making them popular with investors seeking broad market exposure.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Sector ETFs",
                  "focus on specific segments of the economy, such as technology, healthcare, or energy. For instance, a technology sector ETF might hold stocks like Apple, Microsoft, and Google. These funds allow investors to target a particular industry or sector without picking individual stocks, which can be beneficial during favorable market conditions for that industry.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "International ETFs",
                  "provide exposure to global markets by investing in companies outside the investor’s home country. These ETFs can focus on specific regions, such as Europe or Asia, or track emerging markets for investors looking to diversify their portfolios beyond domestic companies.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Bond ETFs",
                  "invest in bonds and other debt instruments, offering a way to gain fixed-income exposure. They can track government bonds, corporate bonds, or municipal bonds, providing a range of choices for income-seeking investors.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Commodity ETFs",
                  "provide exposure to commodities like gold, oil, or agricultural products. These ETFs can track the price of a single commodity or a basket of commodities, offering a convenient way for investors to include commodities in their portfolio without physically purchasing the assets.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Leveraged and Inverse ETFs",
                  "use financial derivatives to amplify the returns of an underlying index (leveraged) or to achieve the opposite returns (inverse). For instance, a 2x leveraged ETF aims to return twice the daily performance of an index, while an inverse ETF would aim to provide the opposite return. These ETFs are more complex and suitable for short-term trading rather than long-term investing due to their increased risk and volatility.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Thematic ETFs",
                  "ocus on specific themes or trends, such as clean energy, artificial intelligence, or blockchain technology. These funds aim to capitalize on emerging trends, offering investors targeted exposure to companies that stand to benefit from the theme’s growth.",
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

                        saveResult(17, score);
                        saveResult(10017, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              17,
                              "Types of ETFs",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson18(),
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
