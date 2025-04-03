import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson24/main.dart';
import '../../app_bar.dart';

class Lesson23 extends StatefulWidget {
  const Lesson23({super.key});

  @override
  State<Lesson23> createState() => _Lesson23();
}

class _Lesson23 extends State<Lesson23> {
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
                  "Lesson 23",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Top 5 crypto explained",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 20),
                keyVocabulary(
                  context,
                  "1. Bitcoin (BTC):",
                  "Bitcoin, created in 2009, is the first and most well-known cryptocurrency. It was introduced by an anonymous person or group known as Satoshi Nakamoto. Bitcoin runs on a decentralized network of computers using blockchain technology to maintain a secure and transparent ledger of transactions. Bitcoin's limited supply of 21 million coins, coupled with increasing demand, makes it attractive to investors as a potential store of value and hedge against inflation.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "2. Ethereum (ETH):",
                  "Ethereum, launched in 2015 by Vitalik Buterin, is the second-largest cryptocurrency by market capitalization. It introduced the concept of smart contracts, which are self-executing contracts that allow developers to build decentralized applications (dApps). Ethereum's flexibility and programmability have made it popular for various blockchain projects beyond just payments, such as DeFi (Decentralized Finance) and NFTs (Non-Fungible Tokens).",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "3. Tether (USDT):",
                  "Tether is a stablecoin, which means its value is pegged to a stable asset, in this case, the U.S. dollar. It was designed to provide the stability of traditional currencies while maintaining the flexibility of cryptocurrencies. Traders and investors often use Tether to move funds between different cryptocurrencies or exchanges, as it reduces exposure to the price volatility typically seen in other cryptocurrencies.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "4. Solana (SOL):",
                  "Solana is a blockchain platform that aims to improve scalability by using a unique consensus mechanism called Proof of History (PoH), which is combined with Proof of Stake (PoS). This allows Solana to process transactions at a high speed and with low fees. It is designed to support decentralized applications and offers similar functionality to Ethereum but with faster transaction speeds.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "5. Binance Coin (BNB):",
                  "Binance Coin was initially created as a utility token for the Binance cryptocurrency exchange. Users holding BNB can receive discounts on trading fees when transacting on Binance. Over time, Binance Coin has evolved to support a broader ecosystem, including DeFi, NFTs, and payments. It operates on the Binance Smart Chain, which allows for decentralized applications and smart contracts.",
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

                        saveResult(23, score);
                        saveResult(10023, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              23,
                              "Top 5 crypto explained",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson24(),
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
