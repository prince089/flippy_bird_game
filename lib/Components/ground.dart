import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flippy_bird_game/Asset/app_config.dart';
import 'package:flippy_bird_game/Asset/assets.dart';
import 'package:flippy_bird_game/Game/fliipy_bird_game.dart';

class Ground extends ParallaxComponent<FliipyBirdGame>
    with HasGameRef<FliipyBirdGame> {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final background = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(background, fill: LayerFill.none),
      )
    ]);
    add(RectangleHitbox(
      position: Vector2(0, gameRef.size.y - Config.groundHeight),
      size: Vector2(gameRef.size.x, Config.groundHeight),
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
