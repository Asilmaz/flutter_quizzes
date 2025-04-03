import 'package:flutter/material.dart';
import '../../buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson25/main.dart';
import '../../app_bar.dart';

class Lesson24 extends StatefulWidget {
  const Lesson24({super.key});

  @override
  State<Lesson24> createState() => _Lesson24();
}

class _Lesson24 extends State<Lesson24> {
  int selectedOption = -1;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final controller2 = PageController(viewportFraction: 0.8, keepPage: true);
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

  List<List<String>> images = [
    [
      "assets/investing/lesson24/1.png",
      "assets/investing/lesson24/2.png",
      "assets/investing/lesson24/3.png",
    ],
    [
      "assets/investing/lesson24/4.png",
      "assets/investing/lesson24/5.png",
    ],
  ];

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
                  "Lesson 24",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Technical Analysis",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                //SizedBox(height: size.height / 20),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Technical Analysis (TA):",
                  "Technical analysis is a methodology for forecasting the future direction of prices by studying past market data, primarily price and volume. TA is based on the belief that price movements follow predictable patterns and trends, which can be identified using various chart patterns and technical indicators.",
                ),
                SizedBox(height: size.height / 30),
                keyVocabulary(
                  context,
                  "Why Technical Analysis Works to Some Extent:",
                  "TA can be effective because it takes into account investor behavior and psychology. Market participants often react in predictable ways to certain patterns and news, creating repeatable trends in price movements. In the case of meme cryptocurrencies, TA can work well since these assets often experience sharp and emotional price movements influenced by social media hype and speculation.",
                ),
                SizedBox(height: size.height / 40),
                Column(
                  children: [
                    SizedBox(
                      height: 0.9 * size.width,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: 3,
                        itemBuilder: (_, index) {
                          return createRecipe(
                            context,
                            0,
                            index % 3,
                            images,
                            h: 0.9,
                          );
                        },
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          type: WormType.thinUnderground,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "When to Use Technical Analysis:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Timing Entry and Exit: ",
                  "TA helps identify optimal times to enter or exit a position. By analyzing price charts and indicators, traders can determine when a cryptocurrency is overbought or oversold, helping them make decisions to buy or sell.",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Identifying Trends: ",
                  "By recognizing patterns and trends in historical data, traders can better understand the market's direction and adjust their strategies accordingly.",
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "It’s important to notice that your decisions should not be based solely on the TA, rather this should be a complement to FA (fundamental analysis). When investing in project (coins that have actual value) first do a thorough FA and use TA only to time your entry and exit. In the case of “Shit coins,” that have no real value, using TA is a good option, though it shouldn't be more than 80% of your analysis. ",
                  style: TextStyle(fontSize: size.height / 50),
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Candlestick Charts and Their Importance:",
                  "Candlestick charts are widely used in technical analysis because they offer a quick visual summary of price movements within a given time frame, helping traders identify trends, reversals, and patterns. Each candlestick captures four data points: open, close, high, and low prices. Line graphs on the other hand show only the mean or median price at a certain time, and thus don’t really show for how much YOU could have sold or bought at any given time.",
                ),
                SizedBox(height: size.height / 40),
                Column(
                  children: [
                    SizedBox(
                      height: 0.9 * size.width,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: 2,
                        itemBuilder: (_, index) {
                          return createRecipe(context, 1, index % 3, images);
                        },
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 2,
                        effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          type: WormType.thinUnderground,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height / 40),
                Text(
                  "Here is a perfect example. According to the line graph you could buy one coin on May the 1st for \$4.04, but actually the price went for a short time to as low as \$3.35. Were you to buy for the low Here is a perfect example. According to the line graph you could buy one coin on May the 1st for \$4.04, but actually the price went for a short time to as low as \$3.35. Were you to buy for the low \$3.35 you would almost instantaneously go up 20%.\$3.35 you would almost instantaneously go up 20%.",
                  style: TextStyle(fontSize: size.height / 60),
                ),
                SizedBox(height: size.height / 20),
                keyVocabulary(
                  context,
                  "Trendlines",
                  "Trendlines are straight lines drawn on price charts to identify the general direction of prices. An upward trendline connects the lows of price movements, while a downward trendline connects the highs. Trendlines are used to identify and confirm trends and should not be broken, which might indicate a change in trend.",
                ),
                createDivider(context),
                Text(
                  "When Not to Buy:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "If a downward trendline is intact,",
                  "it's typically not a good time to buy because the trend is still bearish.",
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "If an upward trendline is broken,",
                  "it may indicate that the bullish trend is weakening, and a reversal could be imminent.",
                ),
                SizedBox(height: size.height / 20),
                zoomImage(context, "assets/investing/lesson24/6.png"),
                SizedBox(height: size.height / 40),
                Text(
                  "Here we can see a strong downtrend. You could technically trade on the small bumps, however that is rather risky, and certainly knowing a bit more about TA would help in this case.",
                  style: TextStyle(fontSize: size.height / 60),
                ),
                SizedBox(height: size.height / 20),
                zoomImage(context, "assets/investing/lesson24/7.png"),
                SizedBox(height: size.height / 40),
                Text(
                  "On this image we can see the trend breaking on the 1st of March - this is a good entry.",
                  style: TextStyle(fontSize: size.height / 60),
                ),
                createDivider(context),
                Text(
                  "Supports and Resistances:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 80),
                subpoint(
                  context,
                  "Support:",
                  "Support is a price level where a downtrend tends to pause due to buying interest. It is seen as a floor that prevents prices from falling further.",
                ),
                SizedBox(height: size.height / 80),
                zoomImage(context, "assets/investing/lesson24/8.png"),
                SizedBox(height: size.height / 60),
                subpoint(
                  context,
                  "Resistance:",
                  "Resistance is a price level where an uptrend tends to pause due to selling interest. It acts as a ceiling that prevents prices from rising further.",
                ),
                SizedBox(height: size.height / 80),
                zoomImage(context, "assets/investing/lesson24/9.png"),
                createDivider(context),
                Text(
                  "When to Use Support and Resistance:",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                subpoint(
                  context,
                  "Buying at Support:",
                  "Traders often buy near support levels as they believe prices are less likely to fall below this level.",
                ),
                SizedBox(height: size.height / 60),
                subpoint(
                  context,
                  "Selling at Resistance:",
                  "Traders sell near resistance levels as they believe prices are unlikely to break above this level.",
                ),
                createDivider(context),
                Text(
                  "Quiz:",
                  style: TextStyle(
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 20),
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
                      //route: const Lesson2(),
                      onClick: () {
                        int score = 0;
                        for (int i = 0; i < usersAnswers.length; i++) {
                          if (usersAnswers[i] ==
                              questions[i]["correctAnswer"]) {
                            score++;
                          }
                        }

                        saveResult(24, score);
                        saveResult(10024, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              24,
                              "Technical Analysis",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson25(),
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
