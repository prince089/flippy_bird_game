import 'package:flippy_bird_game/Asset/assets.dart';
import 'package:flippy_bird_game/Game/fliipy_bird_game.dart';
import 'package:flippy_bird_game/Theme/colors.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FliipyBirdGame game;
  static const String id = "gameOver";
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score ${game.bird.playerscore}',
              style: const TextStyle(
                fontSize: 60,
                fontFamily: "Game",
                color: AppColors.white,
              ),
            ),
            Image.asset(Assets.gameOver),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.orange),
              onPressed: onRestart,
              child: const Text(
                "Play Again",
                style: TextStyle(color: AppColors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove("gameOver");
    game.resumeEngine();
  }
}
