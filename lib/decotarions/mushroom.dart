import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import '/sprite_sheets/decoration_sprite_sheet.dart';
import '/player/game_hero.dart';
import '/main.dart';

class Mushroom extends GameDecoration with Sensor {
  Mushroom(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpriteSheet.mushroom,
          position: position,
          size: Vector2.all(16),
        );

  @override
  void onContact(GameComponent component) {
    if (component is GameHero) {
      (component).addLife(20);
      removeFromParent();
    }
  }

  @override
  void onMount() {
    final initialPosition = position.translate(0, tileSize / -2);
    final deslocamentoX = tileSize * Random().nextDouble();
    final deslocamentoY = tileSize / 2 * Random().nextDouble();
    gameRef.getValueGenerator(
      const Duration(milliseconds: 500),
      onChange: (value) {
        double newX = Curves.decelerate.transform(value);
        double newY = Curves.bounceInOut.transform(value);
        position = initialPosition.translate(
          deslocamentoX * newX,
          deslocamentoY * newY,
        );
      },
    ).start();
    super.onMount();
  }
}
