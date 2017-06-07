import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import "menu.dart";

Future<File> getLocalFile() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return new File('$dir/highscore.txt');
}

Future<int> getHighscore() async {
  try {
    File file = await getLocalFile();
    String contents = await file.readAsString();
    return int.parse(contents);
  } on FileSystemException {
    return 0;
  }
}

Future<Null> writeHighscoreToStorage(int score) async {
  await (await getLocalFile()).writeAsString('$score');
}
