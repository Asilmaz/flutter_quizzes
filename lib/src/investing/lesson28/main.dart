import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson29/main.dart';
import '../../app_bar.dart';

class Lesson28 extends StatefulWidget {
  const Lesson28({super.key});

  @override
  State<Lesson28> createState() => _Lesson28();
}

class _Lesson28 extends State<Lesson28> {
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
                  "Lesson 28",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Types of crypto coins",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "1. Layer 1 Cryptocurrencies:",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 50),
                Text(
                  "Layer 1 cryptocurrencies are the foundational networks of the blockchain ecosystem. They form the underlying structure, or \"mainnet,\" that supports all the other activities on the network. Think of them as the highway system for blockchain transactions. Bitcoin (BTC) and Ethereum (ETH) are prime examples. Bitcoin uses Proof of Work (PoW), which involves miners solving complex mathematical puzzles to secure the network. Ethereum uses Proof of Stake (PoS), where validators are selected based on the amount of cryptocurrency they hold and are willing to \"stake.\" These networks serve as platforms where developers can build applications, tokens, and other Layer 2 solutions.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                Text(
                  "Important Factors to Consider (90% Fundamental Analysis + 10 % Technical Analysis):",
                  style: TextStyle(
                    fontSize: size.height / 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Network security and decentralization: ",
                  "How secure is the network against attacks, and how decentralized is it to prevent control by a single entity?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Transaction speed and fees: ",
                  "How quickly are transactions processed, and what fees do users pay?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Scalability and developer activity: ",
                  "How well can the network handle increasing numbers of transactions, and how active is the developer community in building and improving the ecosystem?",
                ),
                createDivider(context),
                buildQuizScreen(questionNumber: 0),
                createDivider(context),
                buildQuizScreen(questionNumber: 1),
                createDivider(context),
                Text(
                  "2. Stablecoins:",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 50),
                Text(
                  "Stablecoins are designed to minimize the wild price fluctuations seen in most cryptocurrencies by pegging their value to a stable asset like the US dollar or gold. They act as a bridge between traditional finance and crypto, making it easier to move funds in and out of the crypto world. Tether (USDT), USD Coin (USDC), and DAI are some popular examples. Some stablecoins are backed by physical assets held in reserve, while others use algorithms to maintain their peg.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                Text(
                  "Important Factors to Consider (100% Fundamental Analysis):",
                  style: TextStyle(
                    fontSize: size.height / 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                subpoint(
                  context,
                  "Transparency of the backing mechanism or algorithm: ",
                  "Is the stablecoin fully backed by reserves, and can the issuer prove it?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Regulatory compliance and legal stability: ",
                  "Is the stablecoin compliant with financial regulations to ensure long-term stability and avoid legal issues?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Liquidity and acceptance in the market: ",
                  "How widely is the stablecoin used, and is it easily convertible to other currencies?",
                ),
                createDivider(context),
                buildQuizScreen(questionNumber: 2),
                createDivider(context),
                buildQuizScreen(questionNumber: 3),
                createDivider(context),
                Text(
                  "3. Layer 2 Cryptocurrencies:",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 50),
                Text(
                  "Layer 2 cryptocurrencies are secondary protocols built on top of Layer 1 networks to increase scalability. They take transactions off the main blockchain (off-chain) and later settle them on-chain, reducing congestion and fees. The Lightning Network on Bitcoin allows fast transactions with minimal fees, and Polygon (MATIC) on Ethereum enables faster transaction processing through its own proof-of-stake network while settling transactions on Ethereum.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                Text(
                  "Important Factors to Consider (90% Fundamental Analysis + 10 % Technical Analysis):",
                  style: TextStyle(
                    fontSize: size.height / 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                subpoint(
                  context,
                  "Compatibility with the Layer 1 network: ",
                  "Is the Layer 2 solution compatible with the underlying blockchain to ensure smooth integration?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Scalability improvements and transaction costs: ",
                  "How much can the Layer 2 solution improve transaction speed and reduce costs?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Security measures and adoption: ",
                  "How secure is the solution, and how widely is it being adopted by developers and users?",
                ),
                createDivider(context),
                buildQuizScreen(questionNumber: 4),
                createDivider(context),
                buildQuizScreen(questionNumber: 5),
                createDivider(context),
                Text(
                  "4. Meme Coins:",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 50),
                Text(
                  "Meme coins started as a fun and light-hearted take on cryptocurrencies. These coins, such as Dogecoin (DOGE) and Shiba Inu (SHIB), were created largely as jokes but gained significant popularity and market value due to strong online communities and viral marketing. Their value often depends heavily on social media hype and community engagement rather than strong technical fundamentals.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                Text(
                  "Important Factors to Consider (30% Fundamental Analysis + 70% Technical Analysis):",
                  style: TextStyle(
                    fontSize: size.height / 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                subpoint(
                  context,
                  "Community support and hype: ",
                  "Is there a strong online community supporting the coin and generating interest?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Developer activity and roadmap: ",
                  "Is there an active team working on improving the coin, or is it purely speculative?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Real-world use cases or application: ",
                  "Does the coin have any practical use cases or real-world applications, or is it primarily a speculative asset?",
                ),
                createDivider(context),
                buildQuizScreen(questionNumber: 6),
                createDivider(context),
                buildQuizScreen(questionNumber: 7),
                createDivider(context),
                Text(
                  "5. AI Coins:",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 50),
                Text(
                  "AI coins are relatively new (and thus are rather promising) and focus on integrating artificial intelligence with blockchain technology. They support decentralized applications that use AI for various purposes, such as data analysis, predictive modeling, and decision-making. Since they are AI coins they can perform very advanced calculations, and don’t require as much maintenance as other coins, which decreased the maintenance costs. Arkham (ARKM) and Fetch.ai (FET) are examples that enable decentralized AI applications where developers can use AI to automate processes, analyze big data, and more.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                Text(
                  "Important Factors to Consider:",
                  style: TextStyle(
                    fontSize: size.height / 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                subpoint(
                  context,
                  "Practical use cases for AI in the blockchain: ",
                  "How is AI being used practically, and does it offer significant value to users?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Developer activity and research: ",
                  "Is there a strong team of developers and researchers working on advancing the technology?",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Potential partnerships and industry adoption: ",
                  "Are there partnerships with established companies, and how widely is the technology being adopted in the industry? For example: Sam Altman (CEO of Open.Ai) has invested in ARKM.",
                ),
                createDivider(context),
                buildQuizScreen(questionNumber: 8),
                createDivider(context),
                buildQuizScreen(questionNumber: 9),
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
                        saveResult(28, score);
                        saveResult(10028, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              28,
                              "Types of crypto coins",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson29(),
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
