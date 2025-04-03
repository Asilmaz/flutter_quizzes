import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';
import '../buttons.dart';
import '../app_bar.dart';

Widget keyVocabulary(BuildContext context, String text, String definition) {
  Size size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.020,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: size.height / 200,
      ),
      Text(
        definition,
        style: TextStyle(
          fontSize: size.height * 0.020,
        ),
      ),
    ],
  );
}

Widget zoomImage(BuildContext context, String image, {double? w, double? h}) {
  return WidgetZoom(
    heroAnimationTag: image.toString(),
    zoomWidget: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(image),
      ),
    ),
  );
}

Column createExercise(
  BuildContext context,
  int questionNumber,
  String question,
  List<String> answers,
  String? image,
  Widget? imageWidget,
  Function createListTitle,
  String? explanation,
) {
  Size size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Exercise ${questionNumber + 1}.",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 0.02 * size.height,
        ),
      ),
      Text(
        question,
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
      ),
      if (image != null)
        SizedBox(height: MediaQuery.of(context).size.height / 30),
      if (image != null) zoomImage(context, image),
      if (imageWidget != null) imageWidget,
      SizedBox(height: MediaQuery.of(context).size.height / 70),
      Column(
        children: List.generate(answers.length, (index) {
          return Container(
            child: createListTitle(index, answers[index], size),
          );
        }),
      ),
      explanation != null
          ? Column(
              children: [
                SizedBox(height: size.height / 40),
                Text(explanation),
              ],
            )
          : const SizedBox.shrink(),
    ],
  );
}

Widget createDot(
  BuildContext context,
  int usersAnswer,
  Object correct,
  int val,
) {
  Size size = MediaQuery.of(context).size;
  return (usersAnswer == val || correct == val) && usersAnswer != -1
      ? Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width / 30,
          ),
          child: Icon(
            correct == val ? Icons.check_circle : Icons.cancel,
            color: correct == val ? Colors.green : Colors.red,
          ),
        )
      : Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width / 30,
          ),
          child: const Icon(Icons.circle_outlined),
        );
}

Widget createDivider(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      SizedBox(height: size.height / 20),
      Divider(
        color: Theme.of(context).colorScheme.primary,
        thickness: size.height / 200,
      ),
      SizedBox(height: size.height / 20),
    ],
  );
}

Future<void> saveResult(int lessonId, int score) async {
  late SharedPreferences prefs;

  prefs = await SharedPreferences.getInstance();
  int x = prefs.getInt('lesson$lessonId')?.toInt() ?? 0;
  if (score < x) {
    score = x;
  }
  prefs.setInt('lesson$lessonId', score);
}

Widget subpoint(BuildContext context, String text, String definition) {
  Size size = MediaQuery.of(context).size;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: 0.05 * size.width,
          bottom: 0.05 * size.width,
          right: 0.05 * size.width,
        ),
        child: Icon(
          Icons.circle,
          size: 0.02 * size.width,
        ),
      ),
      SizedBox(
        width: 0.7 * size.width,
        child: keyVocabulary(context, text, definition),
      ),
    ],
  );
}

Widget point(BuildContext context, String text) {
  Size size = MediaQuery.of(context).size;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.only(
          right: 0.05 * size.width,
        ),
        child: Icon(
          Icons.circle,
          size: 0.02 * size.width,
        ),
      ),
      SizedBox(
        width: 0.7 * size.width,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 0.02 * size.height,
          ),
        ),
      ),
    ],
  );
}

Container createRecipe(
  BuildContext context,
  int qIndx,
  int index,
  List<List<String>> images, {
  double h = 0.9,
}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    //height: h * size.height,
    //width: h * size.width,
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
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
    child: Padding(
      padding: EdgeInsets.all(size.width / 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FittedBox(
          child: zoomImage(
            context,
            images[qIndx][index],
          ),
        ),
      ),
    ),
    //),
  );
}

class Success extends StatefulWidget {
  final Widget route;
  final int number;
  final String subject;
  final int minutes;
  final int score;
  final int maxscore;

  const Success(
    this.number,
    this.subject,
    this.minutes,
    this.score,
    this.maxscore,
    this.route, {
    super.key,
  });
  double get percentage => ((maxscore == 0) ? 0 : score / maxscore);

  @override
  State<Success> createState() => _Success();
}

class _Success extends State<Success> {
  late SharedPreferences prefs;
  List<int?> scores = List<int?>.filled(13000, null);
  int sum = 0, sum1 = 0;
  int scoreoverall = 60;
  int maxscoreoverall = 69;
  double percentageoverall = 0.87;
  int day = 0;

  Future<void> readMemory() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i <= 35; i++) {
        scores[i] = prefs.getInt('lesson$i')?.toInt();
        scores[10000 + i] = prefs.getInt('lesson${10000 + i}')?.toInt();

        if (scores[i] != null) {
          sum += scores[i]!;
        }
        if (scores[10000 + i] != null) {
          sum1 += scores[10000 + i]!;
        }
      }
      scores[2137] = prefs.getInt('lesson2137')?.toInt();
      scores[12137] = prefs.getInt('lesson12137')?.toInt();

      if (scores[2137] != null) {
        sum += scores[2137]!;
      }
      if (scores[12137] != null) {
        sum1 += scores[12137]!;
      }
      scoreoverall = sum;
      maxscoreoverall = sum1;

      percentageoverall =
          ((maxscoreoverall == 0) ? 0 : scoreoverall / maxscoreoverall);
    });
  }

  Future<void> calcDay() async {
    DateTime firstDay = DateTime.now();
    DateTime today = DateTime.now();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('beginning_date') != null) {
      firstDay = DateTime.parse(prefs.getString('beginning_date')!);
    }
    prefs.setString("InvestingMenuTickedDay$day", "1");

    setState(() {
      day = today.difference(firstDay).inDays + 1;
    });
  }

  Future<void> saveResult() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("InvestingMenuTickedDay$day", "1");
  }

  Future<void> initMemory() async {
    await calcDay();
    await readMemory();
    await saveResult();
  }

  @override
  void initState() {
    super.initState();
    initMemory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  const AssetImage("assets/investing/success_background.gif"),
              fit: BoxFit.cover,
              opacity: ((Theme.of(context).brightness == Brightness.dark)
                  ? 0.3
                  : 0.4),
            ),
          ),
          child: Column(
            children: [
              appBar(context, ""),
              Container(
                margin: EdgeInsets.only(
                  left: size.width / 10,
                  right: size.width / 10,
                  bottom: size.height / 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //appBar(context, "Success"),
                    SizedBox(height: 0.03 * size.height),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "CONGRATS",
                        style: TextStyle(fontSize: 0.1 * size.width),
                      ),
                    ),
                    SizedBox(height: 0.03 * size.height),
                    Text(
                      "Lesson ${widget.number.toString()}",
                      style: TextStyle(fontSize: 0.027 * size.height),
                    ),
                    Text(
                      widget.subject,
                      style: TextStyle(
                        fontSize: 0.025 * size.height,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 0.04 * size.height),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 0.022 * size.height,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        children: [
                          const TextSpan(
                            text: "Time Taken: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "${widget.minutes.toString()} minutes",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.04 * size.height),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 0.022 * size.height,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        children: [
                          const TextSpan(
                            text: "Points: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                "${widget.score.toString()} / ${widget.maxscore.toString()}",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.005 * size.height),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 0.022 * size.height,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        children: [
                          const TextSpan(
                            text: "Percentage Score: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                "${(widget.percentage * 100).toStringAsFixed(0)}%",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.01 * size.height),
                    LinearProgressIndicator(
                      value: widget.percentage,
                      backgroundColor:
                          (Theme.of(context).brightness != Brightness.dark)
                              ? const Color.fromRGBO(135, 136, 226, 1)
                              : const Color.fromARGB(255, 174, 140, 180),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        (Theme.of(context).brightness != Brightness.dark)
                            ? const Color.fromRGBO(94, 23, 235, 1)
                            : Theme.of(context).colorScheme.secondary,
                      ),
                      minHeight: 0.025 * size.height,
                      borderRadius: BorderRadius.circular(21312127),
                    ),
                    SizedBox(height: 0.07 * size.height),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 0.022 * size.height,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        children: [
                          const TextSpan(
                            text: "Overall Points: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                "${scoreoverall.toString()} / ${maxscoreoverall.toString()}",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.005 * size.height),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 0.022 * size.height,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        children: [
                          const TextSpan(
                            text: "Percentage Score Overall: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                "${(percentageoverall * 100).toStringAsFixed(0)}%",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.01 * size.height),
                    LinearProgressIndicator(
                      value: percentageoverall,
                      backgroundColor:
                          (Theme.of(context).brightness != Brightness.dark)
                              ? const Color.fromRGBO(135, 136, 226, 1)
                              : const Color.fromARGB(255, 174, 140, 180),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        (Theme.of(context).brightness != Brightness.dark)
                            ? const Color.fromRGBO(94, 23, 235, 1)
                            : Theme.of(context).colorScheme.secondary,
                      ),
                      minHeight: 0.025 * size.height,
                      borderRadius: BorderRadius.circular(21312127),
                    ),
                    //const Spacer(),
                    SizedBox(height: size.height * 0.1),

                    //SizedBox(height: 0.1 * size.height),
                  ],
                ),
              ),
              if (widget.number != 35)
                Center(
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: RedirectButton(
                      route: widget.route,
                      text: 'Next Class',
                      width: size.width,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
