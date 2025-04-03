import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson23/main.dart';
import '../../app_bar.dart';

class Lesson22 extends StatefulWidget {
  const Lesson22({super.key});

  @override
  State<Lesson22> createState() => _Lesson22();
}

class _Lesson22 extends State<Lesson22> {
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
                  "Lesson 22",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Are cryptocurrencies worthless ?",
                  style: TextStyle(
                    fontSize: size.width / 20,
                  ),
                ),
                SizedBox(height: size.height / 20),
                keyVocabulary(
                  context,
                  "Why Do Cryptocurrencies Have Value, and What Problems Do They Solve?",
                  "Cryptocurrencies derive their value from several factors, including their decentralized nature, limited supply, and the utility they provide. They address specific problems that traditional financial systems have struggled with, offering unique advantages in today's digital world.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "1. Decentralization and Trust:",
                  "Traditional currencies rely on central authorities, like governments and banks, to control the money supply and validate transactions. Cryptocurrencies, on the other hand, use blockchain technology to enable decentralized networks where no single entity has control. This decentralization fosters trust in the system, as transactions can be verified independently by anyone, eliminating the need for a trusted third party.",
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Problem Solved:",
                  "This solves the problem of central authority reliance, reducing the risk of censorship, inflation, and control that central banks and governments can exert over traditional currencies.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "2. Limited Supply:",
                  "Many cryptocurrencies, like Bitcoin, have a predetermined supply cap embedded in their code. Bitcoin, for example, is capped at 21 million coins, making it inherently deflationary as demand increases over time.",
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Problem Solved:",
                  "This combats inflationary pressures often experienced with fiat currencies, where central banks can print more money, reducing its value. Cryptocurrencies with a limited supply can act as a store of value, similar to gold.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "3. Security and Transparency:",
                  "Blockchain technology ensures that every transaction is recorded on a public ledger, which is highly secure due to its decentralized nature. Each transaction is verified by a network of computers (nodes), making it extremely difficult to alter transaction data without consensus from the network.",
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Problem Solved:",
                  "This provides transparency and security, reducing fraud and ensuring that transactions cannot be tampered with once they are added to the blockchain.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "4. Global Accessibility and Financial Inclusion:",
                  "Cryptocurrencies enable anyone with an internet connection to send and receive payments across the globe, often with lower fees and faster transaction times than traditional banking systems. This opens up financial services to millions of unbanked people who lack access to traditional financial institutions.",
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Problem Solved:",
                  "This helps people in underbanked regions participate in the global economy by providing access to financial services like payments and lending.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "5. Programmable Money:",
                  "Some cryptocurrencies, like Ethereum, enable programmable transactions through smart contracts. These are self-executing contracts with the terms of the agreement directly written into code. They automatically execute transactions when predetermined conditions are met.",
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Problem Solved:",
                  "Smart contracts automate complex transactions and reduce the need for intermediaries, which can significantly reduce costs and increase efficiency in various industries like supply chain management, real estate, and finance.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "6. Censorship Resistance:",
                  "In some cases, governments can freeze or confiscate traditional assets, making them inaccessible to their owners. Cryptocurrencies, by being decentralized and often anonymous, make it difficult for authorities to seize or censor transactions.",
                ),
                SizedBox(height: size.height / 40),
                keyVocabulary(
                  context,
                  "Problem Solved:",
                  "This allows individuals to maintain control over their assets without the fear of censorship or seizure by external entities.",
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Summary:",
                  "Cryptocurrencies have value because they solve real-world problems by offering decentralized trust, financial inclusion, secure and transparent transactions, and programmable financial tools. They challenge the traditional financial system by providing alternatives that are not only technologically advanced but also more inclusive and resistant to external control.",
                ),
                createDivider(context),
                Text(
                  "Here's a 10-question multiple-choice quiz based on the lesson:",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 30),
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
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 6,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 7,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 8,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 9,
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

                        saveResult(22, score);
                        saveResult(10022, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              22,
                              "Are cryptocurrencies worthless ?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson23(),
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
