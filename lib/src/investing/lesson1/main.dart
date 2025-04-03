import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson2/main.dart';
import '../../app_bar.dart';

class Lesson1 extends StatefulWidget {
  const Lesson1({super.key});

  @override
  State<Lesson1> createState() => _Lesson1();
}

class _Lesson1 extends State<Lesson1> {
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
  List<int> correct = List<int>.filled(questions.length, -1);

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
                  "Lesson 1",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Why Should You Invest?",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 60),
                //createDivider(context),

                Text(
                  "You've likely been told many times that you should invest, but have you actually started? In the next 2 lessons, I will provide three convincing arguments that might help you make up your mind on this topic. So, let's begin:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                //SizedBox(height: size.height / 60),
                createDivider(context),

                Text(
                  "1. Beat the Inflation",
                  style: TextStyle(
                    fontSize: size.width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
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
                createDivider(context),

                //SizedBox(height: size.height / 30),
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
                  image: "assets/investing/lesson1/algieria.png",
                ),
                createDivider(context),
                Text(
                  "Alright, but while we can print money, we can't print new stocks of a company, another S&P500 ETF, or another bitcoin. This highlights that investing in assets with real worth protects against inflation. An apple remains an apple, but \$5 won't hold its value after 10 years! :)",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                Text(
                  "2. Create Assets",
                  style: TextStyle(
                    fontSize: size.width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 40),
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
                  "Asset -",
                  "generates money for us; in order to become wealthy we need to have assets",
                ),
                SizedBox(height: size.height / 50),
                keyVocabulary(
                  context,
                  "Liabilities -",
                  "takes away money from us; in order to become wealthy we need to have as few liabilities as we can",
                ),
                //SizedBox(height: size.height / 10),
                createDivider(context),
                Text(
                  "While expanding on this point, I am going to refer to the ideas presented in the book 'Rich Dad, Poor Dad' by Robert Kiyosaki, which I highly recommend reading. : ). Alright, in the book, assets are depicted as anything that puts money in your pocket. Kiyosaki emphasizes the concept of making money work for you by investing in assets (as he said, 'Make money work for you'). These could be stocks of companies, real estate properties, businesses, or other income-generating ventures. Assets are the key to financial independence because they generate passive income and increase in value over time. In simple words, you do nothing, and money flows into your pockets.",
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "So now, let’s do a few exercises:",
                  style: TextStyle(fontSize: size.height * 0.02),
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 3,
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

                        saveResult(1, score);
                        saveResult(10001, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              2,
                              "Why Should You Invest?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson2(),
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
