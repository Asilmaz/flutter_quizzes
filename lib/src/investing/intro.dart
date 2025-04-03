import './menu.dart';
import 'package:flutter/material.dart';
import '../buttons.dart';
import 'helper_fn.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _Intro();
}

class _Intro extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/investing/investing_start.png'),
            Container(
              margin: EdgeInsets.only(
                left: size.width / 10,
                right: size.width / 10,
                top: size.height / 40,
                bottom: size.height / 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Introduction to Investing",
                    style: TextStyle(
                      fontSize: size.width / 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                  Text(
                    "You Will Learn:",
                    style: TextStyle(
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height / 50),
                  Text(
                    "- What are stocks, bonds, ETFs, cryptocurrencies.",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                  Text(
                    "- How to choose the best securities and commodities.",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                  SizedBox(height: size.height / 30),
                  Text(
                    "About the course:",
                    style: TextStyle(
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height / 50),
                  Text(
                    "- 5-7 hours",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                  Text(
                    "- 318 questions",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                  Text(
                    "- certificate from 90%",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height / 15),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  //route: const Lesson2(),
                  onClick: () {
                    int score = 1;
                    saveResult(2137, score);
                    saveResult(12137, 1);

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InvestingMenu(),
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
    );
  }
}
