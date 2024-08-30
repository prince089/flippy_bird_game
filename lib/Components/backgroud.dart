import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flippy_bird_game/Asset/assets.dart';

class Backgroud extends SpriteComponent with HasGameRef {
  Backgroud();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
