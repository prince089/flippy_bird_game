import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flippy_bird_game/Asset/app_config.dart';
import 'package:flippy_bird_game/Components/backgroud.dart';
import 'package:flippy_bird_game/Components/bird.dart';
import 'package:flippy_bird_game/Components/ground.dart';
import 'package:flippy_bird_game/Components/pipe_group.dart';
import 'package:flutter/material.dart';

class FliipyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    addAll([
      Backgroud(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = "Score: ${bird.playerscore}";
  }

  TextComponent buildScore() {
    return TextComponent(
      text: "Score: 0",
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: "Game",
        ),
      ),
    );
  }
}
