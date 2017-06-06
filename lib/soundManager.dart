import 'dart:async';
import "dart:math";

import 'package:audioplayer/audioplayer.dart';

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
playSequence(int amount, {random: true}) async {

  if (random) {
    randomFrequencies = [];
    for (int i = 0; i < amount; i++) {
      randomFrequencies.add(pickRandomSoundFrequency());
    }
  }

  for (int i = 0; i < randomFrequencies.length; i++){
    new Timer(new Duration(seconds: i * 3), () async {
      audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${randomFrequencies[i].toString()}.wav");
    });
  }
  print(randomFrequencies);
}
