import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro.dart';
import 'lesson1/main.dart';
import 'lesson2/main.dart';
import 'lesson3/main.dart';
import 'lesson4/main.dart';
import 'lesson5/main.dart';
import 'lesson6/main.dart';
import 'lesson7/main.dart';
import 'lesson8/main.dart';
import 'lesson9/main.dart';
import 'lesson10/main.dart';
import 'lesson11/main.dart';
import 'lesson12/main.dart';
import 'lesson13/main.dart';
import 'lesson14/main.dart';
import 'lesson15/main.dart';
import 'lesson16/main.dart';
import 'lesson17/main.dart';
import 'lesson18/main.dart';
import 'lesson19/main.dart';
import 'lesson20/main.dart';
import 'lesson21/main.dart';
import 'lesson22/main.dart';
import 'lesson23/main.dart';
import 'lesson24/main.dart';
import 'lesson25/main.dart';
import 'lesson26/main.dart';
import 'lesson27/main.dart';
import 'lesson28/main.dart';
import 'lesson29/main.dart';
import 'lesson30/main.dart';
import 'lesson31/main.dart';
import 'lesson32/main.dart';
import 'lesson33/main.dart';
import 'lesson34/main.dart';
import 'lesson35/main.dart';
import '../app_bar.dart';

class InvestingMenu extends StatefulWidget {
  const InvestingMenu({super.key});
  @override
  State<InvestingMenu> createState() => _InvestingMenu();
}

GestureDetector createLesson(
  BuildContext context,
  String text,
  Widget route,
  int number,
) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ),
      );
    },
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              (number == 0) ? Icons.done_rounded : Icons.done_all_rounded,
              size: 0.1 * size.width,
              color: (number == 0)
                  ? Theme.of(context).colorScheme.onSurface.withOpacity(0.3)
                  : Colors.green,
            ),
            SizedBox(width: 0.025 * size.width),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  tileMode: TileMode.decal,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              height: 0.1 * size.height,
              child: SizedBox(
                width: size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height / 45,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 0.025 * size.height),
      ],
    ),
  );
}

class _InvestingMenu extends State<InvestingMenu> {
  late SharedPreferences prefs;
  List<int?> scores = List<int?>.filled(3000, null);
  int sum = 0;

  Future<void> readMemory() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i <= 35; i++) {
        scores[i] = prefs.getInt('lesson$i')?.toInt();
        if (scores[i] != null) {
          sum += scores[i]!;
        }
      }
      scores[2137] = prefs.getInt('lesson2137')?.toInt();
      if (scores[2137] != null) {
        sum += scores[2137]!;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    readMemory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Investing",
                style: TextStyle(
                  fontSize: size.width / 9,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.width / 25),
                Text(
                  "COURSE",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(width: size.width / 20),
                Container(
                  height: 0.04 * size.height,
                  width: 0.2 * size.width,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      sum.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 50),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: size.height / 40),
                  createLesson(
                    context,
                    "Intro",
                    const Intro(),
                    scores[2137] ?? 0,
                  ),
                  createLesson(
                    context,
                    "1. Why Should You Invest?",
                    const Lesson1(),
                    scores[1] ?? 0,
                  ),
                  createLesson(
                    context,
                    "2. Why should you invest continuation ? ",
                    const Lesson2(),
                    scores[2] ?? 0,
                  ),
                  createLesson(
                    context,
                    "3. Is investing really gambling ?",
                    const Lesson3(),
                    scores[3] ?? 0,
                  ),
                  createLesson(
                    context,
                    "4. What are stocks ?",
                    const Lesson4(),
                    scores[4] ?? 0,
                  ),
                  createLesson(
                    context,
                    "5. What are bonds ?",
                    const Lesson5(),
                    scores[5] ?? 0,
                  ),
                  createLesson(
                    context,
                    "6. Key Financial Metrics",
                    const Lesson6(),
                    scores[6] ?? 0,
                  ),
                  createLesson(
                    context,
                    "7. Key Financial Metrics part 2",
                    const Lesson7(),
                    scores[7] ?? 0,
                  ),
                  createLesson(
                    context,
                    "8. Final Key Metrics Quiz",
                    const Lesson8(),
                    scores[8] ?? 0,
                  ),
                  createLesson(
                    context,
                    "9. Value / Growth Stocks",
                    const Lesson9(),
                    scores[9] ?? 0,
                  ),
                  createLesson(
                    context,
                    "10. How to choose a stock ?",
                    const Lesson10(),
                    scores[10] ?? 0,
                  ),
                  createLesson(
                    context,
                    "11. Key Financial Metrics for Bonds",
                    const Lesson11(),
                    scores[11] ?? 0,
                  ),
                  createLesson(
                    context,
                    "12. How to choose a bond ? ",
                    const Lesson12(),
                    scores[12] ?? 0,
                  ),
                  createLesson(
                    context,
                    "13. What is diversification ?",
                    const Lesson13(),
                    scores[13] ?? 0,
                  ),
                  createLesson(
                    context,
                    "14. Practical Analysis of Stocks",
                    const Lesson14(),
                    scores[14] ?? 0,
                  ),
                  createLesson(
                    context,
                    "15. Practical Analysis of Bonds",
                    const Lesson15(),
                    scores[15] ?? 0,
                  ),
                  createLesson(
                    context,
                    "16. What are ETFs ? ",
                    const Lesson16(),
                    scores[16] ?? 0,
                  ),
                  createLesson(
                    context,
                    "17. Types of ETFs",
                    const Lesson17(),
                    scores[17] ?? 0,
                  ),
                  createLesson(
                    context,
                    "18. Shorting, Leverage",
                    const Lesson18(),
                    scores[18] ?? 0,
                  ),
                  createLesson(
                    context,
                    "19. Some of the most popular ETFs",
                    const Lesson19(),
                    scores[19] ?? 0,
                  ),
                  createLesson(
                    context,
                    "20. Final knowledge quiz",
                    const Lesson20(),
                    scores[20] ?? 0,
                  ),
                  createLesson(
                    context,
                    "21. What are cryptocurrencies ?",
                    const Lesson21(),
                    scores[21] ?? 0,
                  ),
                  createLesson(
                    context,
                    "22. Are cryptocurrencies worthless ?",
                    const Lesson22(),
                    scores[22] ?? 0,
                  ),
                  createLesson(
                    context,
                    "23. Top 5 crypto explained",
                    const Lesson23(),
                    scores[23] ?? 0,
                  ),
                  createLesson(
                    context,
                    "24. Technical Analysis ",
                    const Lesson24(),
                    scores[24] ?? 0,
                  ),
                  createLesson(
                    context,
                    "25. Technical Analysis Exercises",
                    const Lesson25(),
                    scores[25] ?? 0,
                  ),
                  createLesson(
                    context,
                    "26. Financial Metrics Of crypto",
                    const Lesson26(),
                    scores[26] ?? 0,
                  ),
                  createLesson(
                    context,
                    "27. Fundamental Analysis",
                    const Lesson27(),
                    scores[27] ?? 0,
                  ),
                  createLesson(
                    context,
                    "28. Types of crypto coins.",
                    const Lesson28(),
                    scores[28] ?? 0,
                  ),
                  createLesson(
                    context,
                    "29. Where can you find info about crypto ?",
                    const Lesson29(),
                    scores[29] ?? 0,
                  ),
                  createLesson(
                    context,
                    "30. How to choose a coin ?",
                    const Lesson30(),
                    scores[30] ?? 0,
                  ),
                  createLesson(
                    context,
                    "31. Scam Prevention",
                    const Lesson31(),
                    scores[31] ?? 0,
                  ),
                  createLesson(
                    context,
                    "32. Final Knowledge Quiz",
                    const Lesson32(),
                    scores[32] ?? 0,
                  ),
                  createLesson(
                    context,
                    "33. Harder Quiz",
                    const Lesson33(),
                    scores[33] ?? 0,
                  ),
                  createLesson(
                    context,
                    "34. How to stay sane while investing ?",
                    const Lesson34(),
                    scores[34] ?? 0,
                  ),
                  createLesson(
                    context,
                    "35. Final Investing Quiz",
                    const Lesson35(),
                    scores[35] ?? 0,
                  ),
                  SizedBox(height: size.height / 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
