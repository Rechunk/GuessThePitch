import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import "language.dart";

Future<File> getLocalFile(String filename) async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return new File('$dir/$filename');
}

// CLEANUP WITH GENERICS
Future<int> getCurrentHighscore() async {
  try {
    File file = await getLocalFile("highscore.txt");
    String contents = await file.readAsString();
    return int.parse(contents);
  } on FileSystemException {
    return 0;
  }
}

Future<Language> getCurrentLanguage() async {
  try {
    File file = await getLocalFile("language.txt");
    String contents = await file.readAsString();
    switch(contents){
      case "Language.ENGLISH":
        return Language.ENGLISH;
        break;
      case "Language.GERMAN":
        return Language.GERMAN;
        break;
    }
    return Language.ENGLISH;
  } on FileSystemException {
    return Language.ENGLISH;
  }
}

Future<Null> writeLanguageToStorage(Language language) async {
  await (await getLocalFile("language.txt")).writeAsString('$language');
}

Future<Null> writeHighscoreToStorage(int score) async {
  await (await getLocalFile("highscore.txt")).writeAsString('$score');
}

