import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flippy_bird_game/Asset/app_config.dart';
import 'package:flippy_bird_game/Asset/assets.dart';
import 'package:flippy_bird_game/Components/pipe.dart';
import 'package:flippy_bird_game/Game/fliipy_bird_game.dart';
import 'package:flippy_bird_game/Game/pipe_postition.dart';

class PipeGroup extends PositionComponent with HasGameRef<FliipyBirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    //calculet dynamic position of pipe
    final heightminusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightminusGround / 4);
    final centeY =
        spacing + _random.nextDouble() * (heightminusGround - spacing);
    addAll([
      Pipe(height: centeY - spacing / 2, pipepostition: PipePostition.top),
      Pipe(
          height: heightminusGround - (centeY + spacing / 2),
          pipepostition: PipePostition.bottom),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
    if (position.x < -40) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    FlameAudio.play(Assets.point);
    gameRef.bird.playerscore += 1;
  }
}
