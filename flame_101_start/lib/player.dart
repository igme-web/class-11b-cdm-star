import 'dart:async';
import 'package:flame/components.dart';
import 'main.dart';

class Player extends SpriteComponent with HasGameReference<FlameDemoGame> {
  // Code will go here
  late Vector2 moveTarget = Vector2.zero();
  final JoystickComponent joystick;
  Player({required this.joystick});
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache("player.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 100);
    moveTarget = position.clone();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * 300 * dt);
      angle = joystick.delta.screenAngle();
    }
  }

  // @override
  // void update(double dt) {
  //   super.update(dt);

  //   if (position.distanceTo(moveTarget) > 1) {
  //     Vector2 direction = (moveTarget - position).normalized();
  //     position.add(direction * 100 * dt);
  //   }
  // }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void moveTo(Vector2 targetPosition) {
    moveTarget = targetPosition;
  }
}
