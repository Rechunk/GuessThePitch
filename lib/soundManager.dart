import 'dart:async';
import "package:flutter/services.dart" show rootBundle;
import "dart:math";

import 'package:audioplayer/audioplayer.dart';
import 'dart:typed_data';
import 'dart:io';

typedef void OnError(Exception exception);

//enum PlayerState { isPlaying, isStopped }

AudioPlayer audioPlayer = new AudioPlayer();

int pickRandomSoundFrequency(){
  return new Random().nextInt(5) + 1;
}
List<int> randomFrequencies = [];

play(int soundFrequency) async {
  final result = await audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${soundFrequency.toString()}.wav");
}
playSequence({random: true}) async {

  if (random) {
    randomFrequencies = [];
    for (int i = 0; i < 5; i++) {
      randomFrequencies.add(pickRandomSoundFrequency());
    }
  }

  audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${randomFrequencies[0].toString()}.wav");
  new Timer(new Duration(milliseconds: 500), () async {
    audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${randomFrequencies[1].toString()}.wav");
  });
  new Timer(new Duration(milliseconds: 1000), () async {
    audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${randomFrequencies[2].toString()}.wav");
  });
  new Timer(new Duration(milliseconds: 1500), () async {
    audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${randomFrequencies[3].toString()}.wav");
  });
  new Timer(new Duration(milliseconds: 2000), () async {
    audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${randomFrequencies[4].toString()}.wav");
  });
  print(randomFrequencies);
}
