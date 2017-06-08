import 'package:flutter/material.dart';
import "file_access.dart";

Color mainColor = new Color(0xFFFF5722);

enum Language { ENGLISH, GERMAN }

Language language = Language.ENGLISH;

String playButtonText = "";
String practiseButtonText = "";
String languageButtonText = "";
String helpButtonText = "";
String exitButtonText = "";
String helpInternetText = "";
String helpText = "";

void setupAllTexts(Language selectedLanguage){
  switch(selectedLanguage){
    case Language.ENGLISH:
      playButtonText = "Play";
      practiseButtonText = "Practise";
      languageButtonText = "Language";
      helpButtonText = "Help";
      exitButtonText = "Exit";
      helpInternetText = "Note: Internet connection required";
      helpText = "The Game starts as soon as you hit 'Play'. \n\nIn the first round,"
          "you will only see one slider. A sound will play and you have to guess the frequency "
          "of the sound by adjusting the slider from left(low frequency) to right(high frequency).\n\n"
          "Click on the checkmark as soon as you are done. The next round you will need to adjust one more slider "
          "and therefor, two sounds play. This continues upto five sliders. From this point on, fight for your "
          "new highscore!";
      break;
    case Language.GERMAN:
      playButtonText = "Spielen";
      practiseButtonText = "Üben";
      languageButtonText = "Sprache";
      helpButtonText = "Hilfe";
      exitButtonText = "Verlassen";
      helpInternetText = "Achtung: Internetverbindung erforderlich";
      helpText = "Das Spiel startet, sobald du auf 'Spielen' drückst.\n\n Du hörst nun einen Ton. Schätze durch das"
          " schieben des Schiebereglers ein, wie hoch dieser Ton war (links = tief, rechts = hoch).\n\nMit jeder Runde kommt ein Ton"
          " hinzu, bis es schließlich fünf werden. Kämpfe von dort an um deinen neuen Highscore!";
      break;
  }
}

class Options extends StatefulWidget {
  @override
  _Options createState() => new _Options();
}

class _Options extends State<Options> {
  @override
  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(languageButtonText),
        leading: new Container(),
        backgroundColor: mainColor,
        actions: [ new IconButton( icon: new Icon( Theme.of(context).platform == TargetPlatform.iOS ? Icons.arrow_forward_ios : Icons.arrow_forward), onPressed: () { Navigator.pop(context); })],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            new GestureDetector(
                onTap: (){
                  writeLanguageToStorage(Language.ENGLISH);
                  setState((){
                    setupAllTexts(Language.ENGLISH);
                  });                },
                child: new Image.asset(
                  "images/english-flag.png",
                ),
            ),
            new GestureDetector(
              onTap: (){
                writeLanguageToStorage(Language.GERMAN);
                setState((){
                  setupAllTexts(Language.GERMAN);
                });
              },
              child: new Image.asset(
                "images/german-flag.png",
              ),
            ),
          ]
        ),
      ),
    );
  }
}