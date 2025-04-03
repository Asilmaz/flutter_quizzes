import '../lesson3/main.dart';
import 'package:flutter/material.dart';
import '../../buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../../app_bar.dart';

class Lesson2 extends StatefulWidget {
  const Lesson2({super.key});

  @override
  State<Lesson2> createState() => _Lesson2();
}

class _Lesson2 extends State<Lesson2> {
  int selectedOption = -1;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final controller2 = PageController(viewportFraction: 0.8, keepPage: true);
  final controller3 = PageController(viewportFraction: 0.8, keepPage: true);
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
      "assets/investing/lesson2/ex1_0.png",
      "assets/investing/lesson2/ex1_1.png",
    ],
    [
      "assets/investing/lesson2/ex2_0.png",
      "assets/investing/lesson2/ex2_1.png",
      "assets/investing/lesson2/ex2_2.png",
      "assets/investing/lesson2/ex2_3.png",
    ],
    [
      "assets/investing/lesson2/ex4_0.png",
      "assets/investing/lesson2/ex4_1.png",
      "assets/investing/lesson2/ex4_2.png",
      "assets/investing/lesson2/ex4_3.png",
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
                  "Lesson 2",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Why Should You Invest? continued...",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "During our previous lesson, I explained the first two reasons, as to why it's worth investing (Beat the inflation; Create Assets), and now I will present the next one :)",
                  style: TextStyle(
                    fontSize: size.width / 25,
                  ),
                ),
                createDivider(context),
                Text(
                  "1. The Power of Exponential Growth",
                  style: TextStyle(
                    fontSize: size.width / 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 40),
                Text(
                  "In high school, you most certainly learned about two main types of functions: we had linear functions and exponential ones - let's see how much you remember :)",
                  style: TextStyle(fontSize: size.height * 0.020),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                  imageWidget: Column(
                    children: [
                      SizedBox(
                        height: 0.73 * size.width,
                        child: PageView.builder(
                          controller: controller,
                          itemCount: 2,
                          itemBuilder: (_, index) {
                            return createRecipe(context, 0, index % 2, images);
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
                ),
                createDivider(context),
                Text(
                  "Okay, so what is the difference ? ",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "A linear function is like taking constant steps, where the change in one variable causes a proportional change in another. For example, if you're walking at a constant speed, the distance you cover over time increases steadily, forming a straight line on a graph. If you are employed in a company and get a fixed wage, then a graph of your wealth against time is a linear function. ",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                Text(
                  "(y=s*x → y=wealth; s=monthly salary; x= time in months)",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "On the other hand, an exponential function is like taking growing steps. Here, the value of one variable increases or decreases at a constantly increasing rate. For instance, if you have an investment that grows at a fixed percentage rate each year, the amount of money you have will increase rapidly over time, forming a curve that gets steeper and steeper on a graph.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                Text(
                  "(y=s*(r)^x → y=wealth; s=initial money investment; r=monthly growth rate; x=time in months)",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "In simpler terms, linear functions increase or decrease steadily, while exponential functions grow or shrink increasingly fast.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                createDivider(context),
                Text(
                  "So let's figure out, what is a better way to become wealthy : )",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "In order to do that let's assume we have two individuals.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 1,
                  imageWidget: Column(
                    children: [
                      SizedBox(
                        height: 0.7 * size.width,
                        child: PageView.builder(
                          controller: controller2,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return createRecipe(context, 1, index % 4, images);
                          },
                        ),
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller2,
                          count: 4,
                          effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            type: WormType.thinUnderground,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 3,
                  imageWidget: Column(
                    children: [
                      SizedBox(
                        height: 0.7 * size.width,
                        child: PageView.builder(
                          controller: controller3,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return createRecipe(context, 2, index % 4, images);
                          },
                        ),
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller3,
                          count: 4,
                          effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            type: WormType.thinUnderground,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 4,
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "Alright, so let’s plot these lines on one graph, and compare the financial situation of Wera and Alex.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
                  ),
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 5,
                  image: 'assets/investing/lesson2/ex6.png',
                ),
                SizedBox(height: size.height / 20),
                Text(
                  "And that will be all for today’s class. Hopefully, right now, you know how we can represent the wealth of an investor (exponential growth) and a typical fixed-wage worker (linear growth). As you can see, though at the beginning a fixed-wage worker will outperform an investor, the scale tips very quickly. Of course, that doesn’t mean you should quit your secure job, but rather it shows the potential investing has.",
                  style: TextStyle(
                    fontSize: 0.02 * size.height,
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
                        saveResult(2, score);
                        saveResult(10002, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              2,
                              "Why Should You Invest? continued...",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson3(),
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
