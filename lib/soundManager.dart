import 'dart:async';
import "dart:math";

import 'package:audioplayer/audioplayer.dart';

typedef void OnError(Exception exception);

AudioPlayer audioPlayer = new AudioPlayer();
List<int> randomFrequencies = [];
int delayBetweenSounds = 2;

int pickRandomSoundFrequency(){
  return new Random().nextInt(5) + 1;
}

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
    new Timer(new Duration(seconds: i * delayBetweenSounds), () async {
      audioPlayer.play("https://rechunk.com/wp-content/uploads/2017/06/Pitch-${randomFrequencies[i].toString()}.wav");
    });
  }
  print(randomFrequencies);
}
