import 'package:flutter/material.dart';
import '../../buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../lesson12/main.dart';
import '../../app_bar.dart';

class Lesson11 extends StatefulWidget {
  const Lesson11({super.key});

  @override
  State<Lesson11> createState() => _Lesson11();
}

class _Lesson11 extends State<Lesson11> {
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
                  "Lesson 11",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Key Financial Metrics for Bonds",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                createDivider(context),
                Text(
                  "1. Coupon Rate:",
                  style: TextStyle(
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "The coupon rate is the annual interest payment expressed as a percentage of the bond's face value. For example, if a bond has a face value of \$1,000 and a coupon rate of 5%, it pays \$50 in interest annually. This rate gives you an idea of the fixed income you can expect from the bond. A higher coupon rate usually provides more income, but it's important to consider other factors like bond maturity and issuer creditworthiness",
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
                  "2. Yield to Maturity (YTM):",
                  style: TextStyle(
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "YTM is the total expected return from a bond if held until maturity, considering both the coupon payments and any difference between the purchase price and the face value. For example, if you buy a bond with a \$1,000 face value for \$900, and it has a 5% coupon rate, the yield to maturity will be higher than the coupon rate due to the discount. YTM helps investors compare bonds with different coupon rates and maturities by showing the total annual return.",
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
                  "3. Current Yield:",
                  style: TextStyle(
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "The current yield is the bond's annual interest payment divided by its current market price. For instance, if a bond with a \$50 annual interest payment trades for \$1,000, the current yield is 5%. However, if the bond's market price falls to \$900, the current yield would increase because you're still getting the same \$50 but at a lower investment cost. This metric helps evaluate the return on investment based on the current price.",
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
                  "4. Credit Rating:",
                  style: TextStyle(
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Credit rating agencies like Moody's, S&P, and Fitch assign credit ratings that reflect a bond issuer's ability to repay its debts. Higher ratings, such as AAA or AA, indicate lower risk, while lower ratings (BB and below) suggest higher risk. For example, U.S. Treasury bonds have high ratings due to the government's low default risk, while high-yield bonds carry lower ratings due to higher default risk.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 60),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                Text(
                  "5. Maturity Date:",
                  style: TextStyle(
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "The maturity date is when the bond’s principal, or face value, is repaid to the investor. Maturities can range from short-term (1 to 5 years) to long-term (10 to 30 years or more). For instance, if you buy a 10-year bond today, the principal will be repaid in 10 years. Longer maturities usually offer higher interest rates but come with greater interest rate risk.",
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
                  "6. Duration:",
                  style: TextStyle(
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Duration measures a bond's sensitivity to interest rate changes. For instance, if a bond has a duration of 5, its price would drop by 5% if interest rates rose by 1%. A higher duration means the bond is more sensitive to interest rate movements. This helps investors understand the potential price volatility of their bond investments.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                createDivider(context),
                Text(
                  "7. Yield Spread:",
                  style: TextStyle(
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "The yield spread compares the yield of a bond with a benchmark yield, like Treasury bonds of similar maturity. For instance, if a corporate bond has a yield of 4% and a similar-maturity Treasury bond has a yield of 2%, the spread is 2%. A higher spread typically indicates a riskier investment, as investors demand higher returns for taking on more risk.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 6,
                ),
                createDivider(context),
                Text(
                  "8. Callability:",
                  style: TextStyle(
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Some bonds have a callable feature, meaning the issuer can redeem the bond before its maturity date. This option benefits issuers if interest rates decline, as they can refinance at lower rates, but it can limit the investor's potential interest income. For example, a bond with a 10-year maturity might be called back after five years, which could affect the expected return.",
                  style: TextStyle(
                    fontSize: size.height / 50,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 7,
                ),
                SizedBox(height: size.height / 20),
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

                        saveResult(11, score);
                        saveResult(10011, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              11,
                              "Key Financial Metrics for Bonds",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson12(),
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
