import 'dart:async';
import "package:flutter/services.dart" show rootBundle;
import "dart:math";

import 'package:audioplayer/audioplayer.dart';
import 'dart:typed_data';
import 'dart:io';

typedef void OnError(Exception exception);

AudioPlayer audioPlayer = new AudioPlayer();
int pickRandomSoundFrequency(){
  return new Random().nextInt(5) + 1;
}
List<int> randomFrequencies = [];

play(int soundFrequency) async {
  final result = await audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${soundFrequency.toString()}.wav");
}
playRandomSequence() async {
  for (int i = 0; i < 5; i++){
    randomFrequencies.add(pickRandomSoundFrequency());
  }
  print("RANDOM FREQUENCIES : ${randomFrequencies}");
  //audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${pickRandomSoundFrequency().toString()}.wav");
}
play2(int soundFrequency) async {
  audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${soundFrequency.toString()}.wav");
}
play3(int soundFrequency) async {
  final result = audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${soundFrequency.toString()}.wav").then(play4(pickRandomSoundFrequency()));
}
play4(int soundFrequency) async {
  final result = audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${soundFrequency.toString()}.wav").then(play5(pickRandomSoundFrequency()));
}
play5(int soundFrequency) async {
  final result = audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${soundFrequency.toString()}.wav");
}