import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'player.dart';
// import 'package:flame/events.dart';

void main() {
  runApp(GameWidget(game: FlameDemoGame()));
}

class FlameDemoGame extends FlameGame {
  late Player player;
  late JoystickComponent joystick;

  final knobPaint = BasicPalette.red.withAlpha(200).paint();
  final knobBgPaint = BasicPalette.red.withAlpha(100).paint();

  // Your game code will go here
  @override
  Future<void> onLoad() async {
    await images.loadAll([
      "player.png", // Just the filename - it knows to look in assets/images/
    ]);

    joystick = JoystickComponent(
      knob: CircleComponent(radius: 15, paint: knobPaint),
      background: CircleComponent(radius: 50, paint: knobBgPaint),
      margin: EdgeInsets.only(left: 20, bottom: 20),
    );

    player = Player(joystick: joystick);
    add(player);
    add(joystick);
  }
}

//Drag

// class FlameDemoGame extends FlameGame with PanDetector {
//   late Player player;

//   // Your game code will go here
//   @override
//   Future<void> onLoad() async {
//     await images.loadAll([
//       "player.png", // Just the filename - it knows to look in assets/images/
//     ]);

//     player = Player();
//     add(player);
//   }

//   @override
//   void onPanUpdate(DragUpdateInfo info) {
//     player.move(info.delta.global);
//   }
// }

//Tap

// class FlameDemoGame extends FlameGame with TapCallbacks {
//   late Player player;

//   // Your game code will go here
//   @override
//   Future<void> onLoad() async {
//     await images.loadAll([
//       "player.png", // Just the filename - it knows to look in assets/images/
//     ]);

//     player = Player();
//     add(player);
//   }

//   @override
//   void onTapUp(TapUpEvent event) {
//     player.moveTo(event.localPosition);
//   }
// }
