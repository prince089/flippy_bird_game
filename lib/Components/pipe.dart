import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flippy_bird_game/Asset/app_config.dart';
import 'package:flippy_bird_game/Asset/assets.dart';
import 'package:flippy_bird_game/Game/fliipy_bird_game.dart';
import 'package:flippy_bird_game/Game/pipe_postition.dart';

class Pipe extends SpriteComponent with HasGameRef<FliipyBirdGame> {
  Pipe({
    required this.height,
    required this.pipepostition,
  });

  @override
  final double height;
  final PipePostition pipepostition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);

    switch (pipepostition) {
      case PipePostition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePostition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
}
