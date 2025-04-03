import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson5/main.dart';
import '../../app_bar.dart';

class Lesson4 extends StatefulWidget {
  const Lesson4({super.key});

  @override
  State<Lesson4> createState() => _Lesson4();
}

class _Lesson4 extends State<Lesson4> {
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
                  "Lesson 4",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "What are stocks ?",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "A stock, also known as equity, represents ownership in part of a corporation, with each unit known as a \"share.\" Owning shares entitles you to a portion of the company’s assets and profits proportional to the amount of stock you own. Stocks are mainly traded on stock exchanges and are a key component of many investors’ portfolios. They must adhere to government regulations that protect investors against fraud.",
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
                  "Companies issue stocks to gather funds to run their businesses. As a shareholder, you don't own the company's physical assets—like office furniture—but you do have a claim on a share of the profits and assets. However, owning shares does not mean you manage the company; that's the role of the board of directors, who aim to increase the company's value, often by hiring executive officers.",
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
                  "The legal structure of corporations limits your liability. If the company fails, its assets can be sold to pay debts, but your personal assets are safe, and you're not required to sell your shares. However, the value of your shares can drop.",
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
                  "As a shareholder, you can vote in company meetings, receive dividends (a dividend is when a company chooses to share a portion of its profits with its shareholders), and sell your shares. The more shares you own, the greater your influence and potential profit share. Stocks come in two main types: common, which typically offer voting rights and dividends, and preferred, which prioritize asset and earnings claims but usually don’t provide voting rights.",
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
                  "Corporations may issue new shares to raise funds, which can dilute existing ownership unless shareholders buy these new shares. Companies might also buy back shares, potentially increasing the value of remaining shares.",
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

                        saveResult(4, score);
                        saveResult(10004, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              4,
                              "What are stocks ?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson5(),
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
