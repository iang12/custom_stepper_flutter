import 'package:flutter/material.dart';

class CircleStep extends StatelessWidget {
  const CircleStep({
    Key? key,
    this.child,
    this.enabled = true,
    this.padding = 8,
  }) : super(key: key);

  final Widget? child;
  final bool enabled;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.3,
      child: Container(
        decoration: enabled
            ? BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              )
            : null,
        child: enabled
            ? const Icon(
                Icons.rocket,
                size: 50,
              )
            : Container(
                height: 20,
                padding: EdgeInsets.all(padding),
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: child,
              ),
      ),
    );
  }
}
