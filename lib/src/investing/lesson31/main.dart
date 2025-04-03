import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson32/main.dart';
import '../../app_bar.dart';

class Lesson31 extends StatefulWidget {
  const Lesson31({super.key});

  @override
  State<Lesson31> createState() => _Lesson31();
}

class _Lesson31 extends State<Lesson31> {
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
                  "Lesson 31",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Scam Prevention",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "In the following section I would like to familiarise with some of the scams you can be affected by, and what can you do to avoid falling victim to them.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                SizedBox(height: size.height / 80),
                Text(
                  "You might think that you would never fall victim to such “easy to detect” scams, but believe me when I tell you - it’s not so simple. Personally, I was also so sure of myself, and still lost \$3k, by connecting my wallet to an account (“phishing” scam). At the same time, since crypto is unregulated, if you do a mistake and lose your money, nobody will help you - there is absolutely no one you could even contact, once it happens your money is gone forever. And that's why I highly recommend you do not neglect this section.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                Text(
                  "Wallet Security: A Guide for Cryptocurrency Users",
                  style: TextStyle(
                    fontSize: size.height / 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                keyVocabulary(
                  context,
                  "Introduction to Wallet Security:",
                  "Cryptocurrency wallets are digital tools that allow you to store, send, and receive cryptocurrencies like Ethereum. They are crucial for managing your digital assets safely. A fundamental rule in cryptocurrency is never to share your private keys or seed phrases, as they are the only barriers protecting your assets from unauthorized access.",
                ),
                SizedBox(height: size.height / 80),
                keyVocabulary(
                  context,
                  "Private Keys and Seed Phrases:",
                  "The private key is akin to a password for your cryptocurrency wallet. It should be kept secret at all times because anyone with access to it can potentially drain your wallet. Similarly, seed phrases, which are a set of words generated when you create a new wallet, should be kept secure and private. Taking screenshots or storing these phrases online can risk exposure to hackers.",
                ),
                buildQuizScreen(questionNumber: 0),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Using Hardware Wallets:",
                  "For enhanced security, using a hardware wallet is recommended. Hardware wallets store your private keys offline, significantly reducing the risk of hacking. Popular options include Ledger and Trezor. These devices ensure that your private key never touches the internet and remains secure even if your computer is compromised.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(questionNumber: 1),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Double-Checking Transactions:",
                  "Always verify the recipient's address before sending cryptocurrencies, as transactions on the blockchain are irreversible. A mistake in entering the address could lead to permanent loss of funds. Additionally, setting spending limits when interacting with smart contracts can prevent losing all your funds due to a buggy or malicious contract.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(questionNumber: 2),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Recognizing Common Scams:",
                  "Scammers often use sophisticated tactics to trick users. Common scams include phishing attempts, where users are lured to malicious sites that mimic legitimate ones, and giveaway scams, which promise doubled returns on sent funds but result in loss. Always be skeptical, verify information, and remember that genuine companies will never ask for your private keys or seed phrases.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(questionNumber: 3),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Enhancing Security with Smart Practices:",
                  "Using strong, unique passwords and enabling two-factor authentication (2FA) adds an extra layer of security to your online accounts, including your cryptocurrency wallets. Avoid using SMS-based 2FA due to vulnerabilities associated with SIM jacking, and consider using a security key for the highest security.",
                ),
                SizedBox(height: size.height / 80),
                buildQuizScreen(questionNumber: 4),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Conclusion:",
                  "Maintaining strict security practices is essential in the world of cryptocurrencies. By understanding how to properly secure wallets, verify transactions, and recognize scams, users can protect their digital assets effectively. Always stay informed and cautious to navigate the crypto space safely.",
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium, // Use the default body text style

                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "If you would like to learn more about some of the tactics employed by scammers, I HIGHLY recommend you read the following website: ",
                        style: TextStyle(
                          fontSize: 0.02 * size.height,
                        ),
                      ),
                      TextSpan(
                        text: "ethereum.org/en/security/",
                        style: TextStyle(
                          decoration:
                              TextDecoration.underline, // Underline decoration
                          fontSize: 0.02 * size.height,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            const url = 'https://ethereum.org/en/security/';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                      ),
                    ],
                  ),
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

                        saveResult(31, score);
                        saveResult(10031, score);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              31,
                              "Scam Prevention",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson32(),
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
