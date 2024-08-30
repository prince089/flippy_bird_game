import 'package:flame/game.dart';
import 'package:flippy_bird_game/Game/fliipy_bird_game.dart';
import 'package:flippy_bird_game/Screen/game_over_screen.dart';
import 'package:flippy_bird_game/Screen/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FliipyBirdGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      "mainMenu": (context, _) => MainMenuScreen(game: game),
      "gameOver": (context, _) => GameOverScreen(game: game)
    },
  ));
}
