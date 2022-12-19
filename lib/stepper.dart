import 'package:flutter/material.dart';
import 'package:stepper_example/bullet_button.dart';

import 'circle_step.dart';

class HorizontalStepper extends StatefulWidget {
  const HorizontalStepper({
    Key? key,
    required this.numberOfSteps,
    required this.currentIndex,
    required this.callBack,
  }) : super(key: key);

  final int numberOfSteps;
  final int currentIndex;
  final void Function(int value) callBack;

  @override
  State<HorizontalStepper> createState() => _HorizontalStepperState();
}

class _HorizontalStepperState extends State<HorizontalStepper> {
  final ScrollController _scrollController = ScrollController();
  double widgetWidth = 150;
  double jumpsValue = 20;
  int countJumps = 1;
  bool isEnd = false;
  bool isTop = true;
  @override
  void initState() {
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels < 20) {
          setState(() {
            isEnd = false;
          });
        }
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          setState(() {
            isEnd = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  widget.numberOfSteps,
                  (index) => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.callBack(index);
                        },
                        child: CircleStep(
                          enabled: index == widget.currentIndex,
                        ),
                      ),
                      if (index < widget.numberOfSteps - 1)
                        Container(
                          height: 2,
                          width: 150,
                          color: Colors.grey,
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (isEnd)
          Positioned(
            left: 0,
            top: 10,
            child: BulletButon(
                icon: Icons.arrow_back_ios,
                onTap: () {
                  if (countJumps < widget.numberOfSteps) {
                    jumpsValue = jumpsValue - widgetWidth;
                    _scrollController.animateTo(
                      jumpsValue,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                  countJumps--;
                }),
          ),
        Positioned(
          right: 0,
          top: 10,
          child: BulletButon(
            onTap: () {
              if (isEnd) {
              } else {
                if (countJumps < widget.numberOfSteps) {
                  jumpsValue = jumpsValue + widgetWidth;
                  _scrollController.animateTo(
                    jumpsValue,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                }
                countJumps++;
              }
            },
            icon: Icons.arrow_forward_ios,
          ),
        )
      ],
    );
  }
}
