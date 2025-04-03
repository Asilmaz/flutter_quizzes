import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson15/main.dart';
import '../../app_bar.dart';

class Lesson14 extends StatefulWidget {
  const Lesson14({super.key});

  @override
  State<Lesson14> createState() => _Lesson14();
}

class _Lesson14 extends State<Lesson14> {
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
                  "Lesson 14",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Practical Analysis of Stocks",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 0,
                  image: "assets/investing/lesson14/ex0.png",
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 1,
                  image: "assets/investing/lesson14/ex1.png",
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 2,
                  image: "assets/investing/lesson14/ex2.png",
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 3,
                  image: "assets/investing/lesson14/ex3.png",
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 4,
                  image: "assets/investing/lesson14/ex4.png",
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 5,
                  image: "assets/investing/lesson14/ex5.png",
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 6,
                  image: "assets/investing/lesson14/ex6.png",
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 7,
                  image: "assets/investing/lesson14/ex7.png",
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 8,
                  image: "assets/investing/lesson14/ex8.png",
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 9,
                  image: "assets/investing/lesson14/ex9.png",
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

                        saveResult(14, score);
                        saveResult(10014, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              14,
                              "Practical Analysis of Stocks",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson15(),
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
