import 'package:flutter/material.dart';
import "file_access.dart";
import "game.dart";

enum Language { ENGLISH, GERMAN, ITALIAN }

Language language = Language.ENGLISH;

String playButtonText = "";
String practiseButtonText = "";
String languageButtonText = "";
String helpButtonText = "";
String exitButtonText = "";
String helpInternetText = "";
String helpText = "";

Color darkOverlay = new Color.fromARGB(150, 0, 0, 0);

List<Color> overlayColors = [
  darkOverlay,
  darkOverlay,
  darkOverlay,
];

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
      overlayColors[0] = Colors.transparent;
      break;
    case Language.GERMAN:
      playButtonText = "Spielen";
      practiseButtonText = "Üben";
      languageButtonText = "Sprache";
      helpButtonText = "Hilfe";
      exitButtonText = "Verlassen";
      helpInternetText = "Achtung: Internetverbindung erforderlich";
      helpText = "Das Spiel startet, sobald du auf 'Spielen' drückst.\n\nDu hörst nun einen Ton. Schätze durch das"
          " schieben des Schiebereglers ein, wie hoch dieser Ton war (links = tief, rechts = hoch).\n\nMit jeder Runde kommt ein Ton"
          " hinzu, bis es schließlich fünf werden. Kämpfe von dort an um deinen neuen Highscore!";
      overlayColors[1] = Colors.transparent;
      break;
    case Language.ITALIAN:
      playButtonText = "Gioca";
      practiseButtonText = "Pratica";
      languageButtonText = "Lingua";
      helpButtonText = "Aiuto";
      exitButtonText = "Lascia";
      helpInternetText = "Attento: Connectione internet richiesta";
      helpText = "Il gioco initzia, quando premi su 'Gioca'. Ora, sentirai un tono. Apprezza la frequenza del tono e muovi il rigolatore"
          " scorrevole (sinistra = profondo, destra = alto). Ogni tondo un altro rigolo scorrevole vienera e sentirai un altro tono"
          " , finche sei arrivato a cinque. Ora, lotta per il tuo Highscore!";
      overlayColors[2] = Colors.transparent;
      break;
  }
}

class Options extends StatefulWidget {
  @override
  _Options createState() => new _Options();
}

class _Options extends State<Options> {

  void darkenAllFlags() {
    for (int i = 0; i < overlayColors.length; i++){
      overlayColors[i] = darkOverlay;
    }
  }

  @override
  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(languageButtonText),
        leading: new Container(),
        backgroundColor: mainColor,
        actions: [ new IconButton( icon: new Icon( Theme.of(context).platform == TargetPlatform.iOS ? Icons.arrow_forward_ios : Icons.arrow_forward), onPressed: () { Navigator.pop(context); })],
      ),
      body: new ListView(
        children: [
          new GestureDetector(
            onTap: (){
              writeLanguageToStorage(Language.ENGLISH);
              setState((){
                darkenAllFlags();
                overlayColors[0] = Colors.transparent;
                setupAllTexts(Language.ENGLISH);
              });                },
            child: new Image.asset(
              "images/english-flag.png",
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.fill,
              color: overlayColors[0],
            ),
          ),
          new GestureDetector(
            onTap: (){
              writeLanguageToStorage(Language.GERMAN);
              setState((){
                darkenAllFlags();
                overlayColors[1] = Colors.transparent;
                setupAllTexts(Language.GERMAN);
              });
            },
            child: new Image.asset(
              "images/german-flag.png",
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.fill,
              color: overlayColors[1],
            ),
          ),
          new GestureDetector(
            onTap: (){
              writeLanguageToStorage(Language.ITALIAN);
              setState((){
                darkenAllFlags();
                overlayColors[2] = Colors.transparent;
                setupAllTexts(Language.ITALIAN);
              });
            },
            child: new Image.asset(
              "images/italian-flag.png",
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.fill,
              color: overlayColors[2],
            ),
          ),
        ]
      )
    );
  }
}

/*
body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            new GestureDetector(
              onTap: (){
                writeLanguageToStorage(Language.ENGLISH);
                setState((){
                  darkenAllFlags();
                  overlayColors[0] = Colors.transparent;
                  setupAllTexts(Language.ENGLISH);
                });                },
              child: new Image.asset(
                "images/english-flag.png",
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.fill,
                color: overlayColors[0],
              ),
            ),
            new GestureDetector(
              onTap: (){
                writeLanguageToStorage(Language.GERMAN);
                setState((){
                  darkenAllFlags();
                  overlayColors[1] = Colors.transparent;
                  setupAllTexts(Language.GERMAN);
                });
              },
              child: new Image.asset(
                "images/german-flag.png",
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.fill,
                color: overlayColors[1],
              ),
            ),
          ]
        ),
      ),
 */