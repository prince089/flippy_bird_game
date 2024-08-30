import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flippy_bird_game/Asset/app_config.dart';
import 'package:flippy_bird_game/Asset/assets.dart';
import 'package:flippy_bird_game/Game/bird_movement.dart';
import 'package:flippy_bird_game/Game/fliipy_bird_game.dart';
import 'package:flutter/material.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FliipyBirdGame>, CollisionCallbacks {
  Bird();

  int playerscore = 0;

  @override
  Future<void> onLoad() async {
    final birdMidFla = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFla = await gameRef.loadSprite(Assets.birdDownFlap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      BirdMovement.middle: birdMidFla,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFla
    };
    current = BirdMovement.middle;
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }

  void fly() {
    add(
      MoveByEffect(Vector2(0, Config.birdgrevity),
          EffectController(duration: 0.2, curve: Curves.decelerate),
          onComplete: () => current = BirdMovement.down),
    );
    current = BirdMovement.up;
    FlameAudio.play(Assets.flying);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    debugPrint('Game Over');
    gameOver();
  }

  void gameOver() {
    FlameAudio.play(Assets.collision);
    gameRef.overlays.add("gameOver");
    gameRef.pauseEngine();
    game.isHit = true;
  }

  void reset() {
    // position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    playerscore = 0;
  }
}
