import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson28/main.dart';
import '../../app_bar.dart';

class Lesson27 extends StatefulWidget {
  const Lesson27({super.key});

  @override
  State<Lesson27> createState() => _Lesson27();
}

class _Lesson27 extends State<Lesson27> {
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
                  "Lesson 27",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Fundamental Analysis",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "When looking for a crypto coin I recommend you go over the following questions and answer each one.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                createDivider(context),
                Text(
                  "1. Check the project",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "When you want to know the intrinsic value of a stock.",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Is there a need for it ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Who is the competition ? Do they have a chance of competing ?",
                ),
                //SizedBox(height: size.height / 10),
                createDivider(context),
                Text(
                  "2. Team",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Who is the team → check their Linked.in, Twitter, etc …",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Do they have any experience ? Fully devoted to the project ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Past projects ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Size of the team ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Hometown laws toward cryptocurrencies ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "How does the team react to adverse events ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "DON’T INVEST IN COINS THAT DON’T SHOW WHO IS ON THE TEAM",
                ),
                createDivider(context),
                Text(
                  "3. Whitepapers",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "How does it work ? Security ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "How active is the coin’s GitHub activity ?",
                ),
                createDivider(context),
                Text(
                  "4. Roadmap",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "How they plan to improve the coin ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Do they follow it ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Do they do things for the created deadline ?",
                ),
                createDivider(context),
                Text(
                  "5. Community",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Is there a community ? Are people interested in the function of the coin, or only the potential capital gain ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "How many Exchanges list this coin ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Any partners ? ",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Followers of bigger crypto people (like Ash)",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Is the TV increasing ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Does sb have a lot of the coin ? What is his/her activity ?",
                ),
                createDivider(context),
                Text(
                  "6. Security",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "How decentralized ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "How many miners approve a transaction ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "How many miners overall ?",
                ),
                createDivider(context),
                Text(
                  "7. Earnings",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Does it have like “dividends” - ex. Uniswap",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "Max Supply ?",
                ),
                SizedBox(height: size.height / 80),
                point(
                  context,
                  "How many coins mined each year ? Is it inflationary  ? ",
                ),
                createDivider(context),
                buildQuizScreen(questionNumber: 0),
                createDivider(context),
                buildQuizScreen(questionNumber: 1),
                createDivider(context),
                buildQuizScreen(questionNumber: 2),
                createDivider(context),
                buildQuizScreen(questionNumber: 3),
                SizedBox(height: size.height / 10),
                Center(
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: RedirectButton(
                      onClick: () {
                        int score = 0;
                        for (int i = 0; i < usersAnswers.length; i++) {
                          if (usersAnswers[i] ==
                              questions[i]["correctAnswer"]) {
                            score++;
                          }
                        }

                        saveResult(27, score);
                        saveResult(10027, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              27,
                              "Fundamental Analysis",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson28(),
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
