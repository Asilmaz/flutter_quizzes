import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson6/main.dart';
import '../../app_bar.dart';

class Lesson5 extends StatefulWidget {
  const Lesson5({super.key});

  @override
  State<Lesson5> createState() => _Lesson5();
}

class _Lesson5 extends State<Lesson5> {
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
                  "Lesson 5",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "What are bonds ?",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "A bond is essentially a loan that investors give to companies or governments in exchange for interest payments over time.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "When you buy a bond, you're lending money to the issuer (which could be a corporation or a government entity). In return, the issuer promises to pay you interest at regular intervals and return the principal amount on the maturity date. Unlike stocks, bonds don't give you ownership in a company but rather a creditor's claim on its assets.",
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
                  "Companies and governments issue bonds to raise funds for various purposes. ",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Corporations might issue bonds to finance new projects, expand operations, or refinance existing debt. Governments issue bonds to fund infrastructure, public services, or other budgetary needs. Bondholders do not have any say in how the issuer runs its operations, but they do have a higher claim on assets than shareholders if the issuer defaults.",
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
                  "Bonds are considered safer investments compared to stocks because of the predictable interest payments and the promise of getting the principal back. ",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "However, bonds aren't without risk. They can be affected by changes in interest rates, inflation, and credit risk. If the issuer defaults, bondholders might not receive their principal or interest payments as expected.",
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
                  "Bondholders are generally classified into two main categories: secured and unsecured.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Secured bonds are backed by collateral, which means that in the event of default, bondholders can claim specific assets to recover their investment. Unsecured bonds, also known as debentures, rely on the issuer's creditworthiness and have no specific assets backing them. Interest rates for unsecured bonds are typically higher to compensate for the increased risk.",
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
                  "Some bonds can be converted into company stock, offering potential for capital growth. ",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Known as convertible bonds, they allow bondholders to convert their bonds into a predetermined number of shares. This feature appeals to investors who seek the stability of bonds with the potential upside of stocks. Convertible bonds usually offer lower interest rates to balance this flexibility.",
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
                  "Interest rates and inflation rates significantly impact bond prices.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "When interest rates rise, new bonds offer higher yields than existing ones, making older bonds with lower rates less attractive. This causes the prices of existing bonds to fall so that their yields align with the new rates. Conversely, when interest rates drop, existing bonds with higher rates become more attractive, and their prices tend to rise.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                Text(
                  "Inflation also affects bond prices. As inflation increases, the purchasing power of the interest payments and principal repayment decreases. Investors demand higher yields to compensate for this reduced purchasing power, leading to a drop in the prices of existing bonds. In contrast, low inflation maintains or increases the value of the fixed payments, often leading to a rise in bond prices.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 5,
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

                        saveResult(5, score);
                        saveResult(10005, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              5,
                              "What are bonds ?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson6(),
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
