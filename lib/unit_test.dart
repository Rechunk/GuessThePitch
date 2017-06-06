import 'package:test/test.dart';
import 'package:flutter/material.dart';
import "game.dart";
import "soundManager.dart";

void main(){
  Game game = new Game();
  var gameview = game.createState();


  test("get_difference", () {
    randomFrequencies = [1, 2, 3, 4, 5];
    gameview.values = [1, 3, 1, 5, 5];
    expect(gameview.getDifferenceToExactResult(), [0, -1, 2, -1, 0]);
  });
}
