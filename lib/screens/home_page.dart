import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/component/box.dart';
import 'package:tic_tac_toe_game/core.dart';

import '../component/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Text(
            "Round\n${game.turn}",
            textAlign: TextAlign.center,
          ),
        ),
        title: const Text("Tic Tac Toe"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Dashboard(
                playerXScore: game.playerXScore,
                playerOScore: game.playerOScore),
            const SizedBox(height: 40),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: Column(
                children: List.generate(
                  3,
                  (i) => Expanded(
                    child: Row(
                      children: [
                        Box(
                          index: 3 * i,
                          onTaped: () {
                            onBoxTaped(3 * i);
                          },
                        ),
                        Box(
                          index: 3 * i + 1,
                          onTaped: () {
                            onBoxTaped(3 * i + 1);
                          },
                        ),
                        Box(
                          index: 3 * i + 2,
                          onTaped: () {
                            onBoxTaped(3 * i + 2);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                clearAllData();
              },
              borderRadius: BorderRadius.circular(30),
              child: const Icon(
                Icons.replay_circle_filled_outlined,
                size: 60,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  onBoxTaped(int index) {
    setState(() {
      game.setValueOf(index, game.currentPlayer);
    });
    GameState state = game.getGameState();
    if (state == GameState.tie) {
      game.turn++;
      rePlayTheGame();
    } else if (state == GameState.xWin) {
      game.turn++;
      game.playerXScore++;
      showWinnerDialog(winner: "X");
    } else if (state == GameState.oWin) {
      game.turn++;
      game.playerOScore++;
      showWinnerDialog(winner: "O");
    }
  }

  void rePlayTheGame() {
    setState(() {
      game.rePlay();
    });
  }

  void clearAllData() {
    game.playerOScore = game.playerXScore = game.turn = 0;
    rePlayTheGame();
  }

  void showWinnerDialog({required String winner}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Game Over'),
        content: Text(winner == 'X' ? 'Player X wins 🏆' : 'Player O wins 🏆'),
        actions: [
          TextButton(
            onPressed: () {
              rePlayTheGame();
              Navigator.pop(context);
            },
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }
}
