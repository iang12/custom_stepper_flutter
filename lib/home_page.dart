import 'package:flutter/material.dart';
import 'package:stepper_example/stepper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: const EdgeInsets.all(16),
                color: Colors.transparent,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    HorizontalStepper(
                      callBack: (int index) {
                        setState(
                          () {
                            currentIndex = index;
                          },
                        );
                      },
                      numberOfSteps: 12,
                      currentIndex: currentIndex,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
