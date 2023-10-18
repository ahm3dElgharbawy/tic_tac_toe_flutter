import 'package:flutter/material.dart';

import '../core.dart';

XOGame game = XOGame();

class Box extends StatefulWidget {
  const Box({
    super.key,
    required this.index,
    required this.onTaped,
  });
  final int index;
  final void Function()  onTaped;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    scaleAnimation = Tween(begin: 0.0, end: 1.5).animate(controller);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onTaped();
          controller.reset();
          controller.forward();
        },
        child: Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          height: double.infinity,
          child: Center(
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Text(
                game.getValueOf(widget.index),
                style: TextStyle(
                  fontSize: 30,
                  color: game.getValueOf(widget.index) == "O"
                      ? Colors.red
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
