import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson22/main.dart';
import '../../app_bar.dart';

class Lesson21 extends StatefulWidget {
  const Lesson21({super.key});

  @override
  State<Lesson21> createState() => _Lesson21();
}

class _Lesson21 extends State<Lesson21> {
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
                  "Lesson 21",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "What are cryptocurrencies ?",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 20),
                keyVocabulary(
                  context,
                  "Cryptocurrencies",
                  "are digital or virtual currencies that use advanced encryption methods called cryptography to secure transactions and control the creation of new units. Unlike traditional currencies, which are issued by central banks, cryptocurrencies operate on decentralized networks, meaning they don't rely on a central authority. The technology that enables this decentralization is called blockchain. Bitcoin, which launched in 2009, was the first cryptocurrency and remains the most well-known and valuable. Cryptocurrencies facilitate direct transactions between users without needing a middleman like a bank, which can speed up the transaction process and reduce fees. However, the value of cryptocurrencies can change significantly due to various factors, such as market demand, changes in regulation, and developments in technology.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Blockchain",
                  "is the underlying technology that powers cryptocurrencies. A blockchain is a digital ledger distributed across a network of computers. It records all cryptocurrency transactions, with each transaction grouped into a \"block.\" These blocks are linked together, creating a chronological chain of data known as a blockchain. Each block contains a cryptographic link to the previous block, which ensures that no one can tamper with the transaction history without altering all subsequent blocks, making the blockchain very secure. This structure ensures the integrity and transparency of the data, making it resistant to tampering and fraud.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Miners",
                  "are essential participants in blockchain networks. They operate powerful computers that solve complex mathematical problems to validate transactions and add them to the blockchain. This process, known as mining, secures the network and prevents fraudulent transactions. Miners are incentivized through rewards, typically in the form of newly created cryptocurrency. For instance, Bitcoin miners receive newly created bitcoins as a reward for each block they successfully add to the blockchain, which helps sustain the decentralized network.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Crypto Security",
                  "is crucial because digital assets are attractive targets for hackers and thieves. Cryptocurrency wallets store these digital assets. Hot wallets are connected to the internet, making them convenient for transactions but also more vulnerable to hacks. Cold wallets, on the other hand, store cryptocurrencies offline and thus provide better protection. Users can enhance the security of their crypto assets by using strong passwords, enabling two-factor authentication, and employing hardware wallets that store private keys offline.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Crypto Transactions",
                  "occur on blockchain networks, where each transaction is recorded in a public ledger. A sender needs a private key to sign a transaction before broadcasting it to the network, ensuring that only authorized transactions can occur. Miners then validate the transaction, and once approved, it is added to the blockchain. This transparent process prevents double-spending, which happens when the same cryptocurrency unit is used more than once in transactions. The blockchain's distributed nature and validation by miners prevent this by ensuring that each transaction is unique.",
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

                        saveResult(21, score);
                        saveResult(10021, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              21,
                              "What are cryptocurrencies ?",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson22(),
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
