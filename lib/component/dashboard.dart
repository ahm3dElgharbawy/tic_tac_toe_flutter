import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
    required this.playerXScore,
    required this.playerOScore,
  });

  final int playerXScore;
  final int playerOScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Text(
              "Player X",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              playerXScore.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const Text(
          "vs",
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            const Text(
              "Player O",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              playerOScore.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}
