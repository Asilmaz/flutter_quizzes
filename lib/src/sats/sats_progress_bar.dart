import 'package:flutter/material.dart';

class SatsProgressBar extends StatefulWidget {
  final List<bool?> answers;

  const SatsProgressBar({
    super.key,
    required this.answers,
  });

  @override
  _SatsProgressBarState createState() => _SatsProgressBarState();
}

class _SatsProgressBarState extends State<SatsProgressBar> {
  int lastNonNullIndex = -1;
  int previousLastNonNullIndex = -1;
  double animatedWidth = 0.0;
  List<bool?> oldAnswers = [];
  bool bar_done = true;

  @override
  void didUpdateWidget(SatsProgressBar oldWidget) {
    previousLastNonNullIndex = lastNonNullIndex;
    // print("updating");
    // print("widget: ${widget.answers}");
    // print("oldWidget: ${oldWidget.answers}");
    // print("oldAnswers: $oldAnswers");
    lastNonNullIndex = widget.answers.lastIndexWhere((element) => element != null);
    // print("lastNonNullIndex: $lastNonNullIndex");
    // print("previousLastNonNullIndex: $previousLastNonNullIndex");
    super.didUpdateWidget(oldWidget);
    if (lastNonNullIndex != previousLastNonNullIndex) {
      if (lastNonNullIndex != -1) {
        setState(() {
          animatedWidth = 0.0;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            animatedWidth = 1.0;
            bar_done = true;
          });
        });
      }
    }
    oldAnswers = widget.answers;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.005,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(widget.answers.length, (index) {
              if (index == lastNonNullIndex && bar_done) {
                // print("ANIMATION");
                // print("animatedWidth: $animatedWidth");
                return Flexible(
                  flex: 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: animatedWidth * size.width * 0.9 / widget.answers.length,
                    color: widget.answers[index] == null
                        ? null
                        : widget.answers[index]!
                        ? Colors.green
                        : Colors.red,
                    child: const Align(
                      alignment: Alignment.center,
                    ),
                  ),
                );
              } else if (index <= lastNonNullIndex) {
                return Flexible(
                  flex: 1,
                  child: Container(
                    color: widget.answers[index] == null
                        ? null
                        : widget.answers[index]!
                            ? Colors.green
                            : Colors.red,
                    child: const Align(
                      alignment: Alignment.center,
                    ),
                  ),
                );
              } else  {
                return Flexible(
                  flex: 1,
                  child: Container(
                    color: null,
                    child: const Align(
                      alignment: Alignment.center,
                    ),
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
