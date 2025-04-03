import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson31/main.dart';
import '../../app_bar.dart';

class Lesson30 extends StatefulWidget {
  const Lesson30({super.key});

  @override
  State<Lesson30> createState() => _Lesson30();
}

class _Lesson30 extends State<Lesson30> {
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
                  "Lesson 30",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "How to choose a coin ?",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                createDivider(context),
                Text(
                  "How to Choose a Crypto Coin: A Step-by-Step Guide",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //createDivider(context),

                SizedBox(height: size.height / 20),

                Text(
                  "START with the FA (Fundamental Analysis) - answer all the questions give in the 27th lesson.",
                  style: TextStyle(
                    fontSize: 0.03 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Step 1: Define Your Investment Goals",
                  "Clarify your purpose for investing in cryptocurrencies. Are you seeking long-term growth, short-term gains, or diversification? Understanding your goals will guide you in selecting coins that fit your investment strategy and risk tolerance.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Step 2: Research the Technology and Use Case",
                  "Understand the technology behind the coin and the problem it aims to solve. Is the coin designed for payments, smart contracts, or something else? A clear use case helps you gauge the coin's long-term potential.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Step 3: Evaluate the Team and Community",
                  "Look into the team behind the project. Are they experienced and transparent? Also, assess the community supporting the coin, as a strong community indicates engagement and potential adoption.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Step 4: Analyze the Whitepaper",
                  "A cryptocurrency's whitepaper provides in-depth details about the project, including its technology, roadmap, and vision. Analyzing the whitepaper helps you understand the project's goals and the team's ability to execute them.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Step 5: Assess Market Liquidity and Volume",
                  "Liquidity refers to how easily a coin can be bought or sold without affecting its price. Coins with high trading volume and liquidity are easier to trade, reducing the risk of significant price changes during transactions.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(
                  questionNumber: 4,
                ),
                createDivider(context),
                Text(
                  "Do the TA (technical Analysis) and choose a price for which you would like to buy the coin.",
                  style: TextStyle(
                    fontSize: 0.03 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Step 6: Evaluate Risk and Volatility",
                  "Crypto markets are known for their volatility. Assessing a coin's historical price movements helps you understand its risk profile. High volatility might offer higher returns but also brings increased risk.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Step 7: Check Regulatory Compliance",
                  "Ensure the coin complies with relevant regulations to avoid potential legal issues. This is crucial for exchanges, privacy coins, and projects that interact with traditional financial systems..",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(questionNumber: 6),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Step 8: Diversify Your Portfolio",
                  "Avoid putting all your investment in one coin or category. Diversifying across different types of cryptocurrencies and sectors helps manage risk and reduces the impact of volatility on your portfolio.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(
                  questionNumber: 7,
                ),
                createDivider(context),
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

                        saveResult(30, score);
                        saveResult(10030, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              30,
                              "How to choose a coin ?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson31(),
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
