import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson35/main.dart';
import '../../app_bar.dart';

class Lesson34 extends StatefulWidget {
  const Lesson34({super.key});

  @override
  State<Lesson34> createState() => _Lesson34();
}

class _Lesson34 extends State<Lesson34> {
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
                  "Lesson 34",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "How to stay sane while investing ?",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "You may be surprised by this topic, but believe me when I tell you it’s extremely important. Investing (especially trading) is extremely addicting, and can take aways your life if you do not stay on guard. Below are some tips that will help you. ",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Staying Sane While Investing: Managing Emotions and Keeping Balance",
                  "Investing, especially in volatile markets like cryptocurrencies, can be an emotional rollercoaster. It's easy to get swept up in the excitement of potential profits or the fear of losses. To navigate the market successfully, it's crucial to maintain a clear head and stick to well-planned strategies. Here are some key aspects to help you stay sane while investing:",
                ),
                SizedBox(height: size.height / 80),
                keyVocabulary(
                  context,
                  "1. Understanding FOMO (Fear of Missing Out):",
                  "FOMO is a powerful emotion that can lead to impulsive investment decisions, often resulting in buying at the top of a rally. The fear that others are making gains while you're missing out can cloud your judgment, leading to risky and often unprofitable decisions.",
                ),
                SizedBox(height: size.height / 80),
                Text(
                  "Tips to manage FOMO:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Stick to your plan:",
                  "Have a clear strategy and set investment criteria to avoid impulsive decisions.",
                ),
                subpoint(
                  context,
                  "Analyze before acting:",
                  "Don't rush into investments; take time to research and evaluate the opportunity.",
                ),
                SizedBox(height: size.height / 40),
                buildQuizScreen(questionNumber: 0),
                createDivider(context),
                keyVocabulary(
                  context,
                  "2. Avoiding Panic Selling:",
                  "Panic selling occurs when fear overwhelms an investor, leading to the rapid sale of assets at a loss. It's often driven by market downturns and can lock in losses that could have been avoided by staying the course.",
                ),
                SizedBox(height: size.height / 80),
                Text(
                  "Tips to avoid panic selling:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Trust your research:",
                  "Stick to your research and investment thesis, even in downturns.",
                ),
                subpoint(
                  context,
                  "Have a long-term view:",
                  "Remember that markets often recover from dips over time.",
                ),
                SizedBox(height: size.height / 40),
                buildQuizScreen(questionNumber: 1),
                createDivider(context),
                keyVocabulary(
                  context,
                  "3. Maintaining Balance:",
                  "Investing can become all-consuming, leading to burnout and poor decision-making. It's important to maintain a healthy balance between investing and other aspects of life.",
                ),
                SizedBox(height: size.height / 80),
                Text(
                  "Tips to maintain balance:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Schedule downtime:",
                  "Set aside time each week to disconnect from market activities.",
                ),
                subpoint(
                  context,
                  "Practice mindfulness:",
                  "Techniques like meditation can help reduce stress.",
                ),
                SizedBox(height: size.height / 40),
                buildQuizScreen(questionNumber: 2),
                createDivider(context),
                keyVocabulary(
                  context,
                  "4. Finding Rest Days:",
                  "Constantly watching the markets can lead to fatigue and mistakes. Taking regular breaks helps refresh your mind and allows you to return to trading with a clearer perspective.",
                ),
                SizedBox(height: size.height / 80),
                Text(
                  "Tips for finding rest days:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Designate no-trade days:",
                  "Choose days when you will not engage in any trading activities.",
                ),
                subpoint(
                  context,
                  "Limit screen time:",
                  "Allocate specific times for checking the market to avoid constant monitoring.",
                ),
                SizedBox(height: size.height / 40),
                buildQuizScreen(questionNumber: 3),
                createDivider(context),
                keyVocabulary(
                  context,
                  "5. Trading in a Team:",
                  "Trading in a team can help distribute the workload, provide emotional support, and offer different perspectives on market trends.",
                ),
                SizedBox(height: size.height / 80),
                Text(
                  "Tips for successful team trading:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Divide responsibilities:",
                  "Assign different roles within the team based on each member's strengths.",
                ),
                subpoint(
                  context,
                  "Communicate regularly:",
                  "Keep everyone updated on market insights and decisions.",
                ),
                SizedBox(height: size.height / 40),
                buildQuizScreen(questionNumber: 4),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Conclusion",
                  "Staying sane while investing requires discipline, self-awareness, and a well-thought-out strategy. By understanding the impact of emotions like FOMO and panic selling, maintaining balance, and finding rest days, investors can navigate the markets more effectively. Trading in a team can also offer valuable support, ensuring you're not going through the investment journey alone.",
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

                        saveResult(34, score);
                        saveResult(10034, score);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              34,
                              "How to stay sane while investing ?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson35(),
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
