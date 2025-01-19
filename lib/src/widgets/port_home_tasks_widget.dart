import 'package:flutter/material.dart';
import 'dart:math';

// Przemyśleć przeniesienie do StatefulWidget
class PortHomeTasksWidget extends StatelessWidget {
  final List<String> plan;
  final List<String> basePlanTicked;
  final Map<String, String> sectionNames;
  Brightness themeBrightness = Brightness.light;

  PortHomeTasksWidget({
    super.key,
    required this.plan,
    required this.basePlanTicked,
    required this.sectionNames,
  });

  static List<List<Color>> gradients = [
    [ Color(0xFF5D228E), Color(0xFF734894) ],
    [ Color(0xFF8A94FB), Color(0xFF5E6BEA) ],
  ];

  @override
  Widget build(BuildContext context) {
    print("sectionNames: $sectionNames");
    print("plan: $plan");
    //Size size = MediaQuery.of(context).size;
    //Size size = MediaQuery.sizeOf(context);
    Size size = Size(400, 400);
    return Container(
      width: size.width,
      //width: size.height / 8,
      height: size.height,
      //height: size.height / 8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradients[ themeBrightness == Brightness.light ? 1 : 0 ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          transform: GradientRotation(0.25),
          //stops: [0.2, 0.6, 1],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: size.height / 12),
          Flexible(
            child: Text(
              "To - Do List",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: size.width / 8,
                fontFamily: "OpenSauceTwo",
              ),
            ),
          ),
          SizedBox(height: size.height / 35),
          for (int i = 0; i < min(plan.length, 1); i++)
            Padding(padding: EdgeInsets.only(top: 7, bottom: 7, left: size.width / 8),
            child: Row(
              children: [
                SizedBox(
                  width: size.width / 10,
                  height: size.height / 10,
                  child: Icon(
                    size: size.width / 8,
                    basePlanTicked[i] == "1" ? Icons.check_circle_rounded : Icons.circle_outlined,
                    //basePlanTicked[i] == "1" ? "◉" : "○",
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: size.width / 17),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height / 75),
                    child: Text(
                      sectionNames[plan[i]]!,
                      style: TextStyle(
                        fontSize: size.width / 11,
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSauceTwo",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
        ],
      ),
    );
  }
}
