import 'package:flutter/material.dart';
import "route.dart";
import "game.dart";
import "config.dart";
import "help.dart";
import "file_access.dart";
import "dart:io";
import "practise.dart";
import "soundManager.dart";
import "language.dart";

class Menu extends StatefulWidget {
  @override
  _Menu createState() => new _Menu();
}

int highscore = 0;

class _Menu extends State<Menu> {

  @override
  void initState() {
    super.initState();
    getCurrentHighscore().then((int value) {
      setState(() {
        highscore = value;
      });
    });
  }
  @override
  build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("GUESS THE", style: new TextStyle(fontFamily: "Coiny", fontSize: 45.0, color: new Color(0xFF7F4937))),
            new Text("PITCH", style: new TextStyle(fontFamily: "Coiny", fontSize: 83.0, height: 0.1, color: mainColor)),
            new Container(
              margin: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
              child: new Text("HIGHSCORE: $highscore", style: new TextStyle(fontFamily: "Coiny", fontSize: 20.0, color: new Color(0xFFFF916E))),
            ),
            new Container(
              margin: new EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
              child: new Container(
                child: new Column(
                  children: [
                    new Padding(
                      padding: new EdgeInsets.all(7.0),
                      child: new RaisedButton(color: Colors.transparent, elevation: 0.0, highlightElevation: 0.0, splashColor: Colors.red,
                        child: new Text(playButtonText, style: new TextStyle(fontSize: 23.0, fontFamily: "Quicksand")),
                        onPressed: (){
                        shouldPlayNext = true;
                        Navigator.push(context, new CustomRoute(
                            navigationDirection: rightToLeft,
                            builder: (_) => new Game()
                        ));
                      }),
                    ),
                    new Padding(
                      padding: new EdgeInsets.all(7.0),
                      child: new RaisedButton(color: Colors.transparent, elevation: 0.0, highlightElevation: 0.0, splashColor: Colors.red,
                        child: new Text(practiseButtonText, style: new TextStyle(fontSize: 23.0, fontFamily: "Quicksand")),
                        onPressed: (){
                          Navigator.push(context, new CustomRoute(
                              navigationDirection: rightToLeft,
                              builder: (_) => new Playground()
                          ));
                        }
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.all(7.0),
                      child: new RaisedButton(color: Colors.transparent, elevation: 0.0, highlightElevation: 0.0, splashColor: Colors.red,
                        child: new Text(languageButtonText, style: new TextStyle(fontSize: 23.0, fontFamily: "Quicksand")),
                        onPressed: (){
                          Navigator.push(context, new CustomRoute(
                              navigationDirection: leftToRight,
                              builder: (_) => new Options()
                          ));
                        }
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.all(7.0),
                      child: new RaisedButton(color: Colors.transparent, elevation: 0.0, highlightElevation: 0.0, splashColor: Colors.red,
                        child: new Text(helpButtonText, style: new TextStyle(fontSize: 23.0, fontFamily: "Quicksand")),
                        onPressed: (){
                          Navigator.push(context, new CustomRoute(
                              navigationDirection: leftToRight,
                              builder: (_) => new Help()
                          ));
                        }
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.all(7.0),
                      child: new RaisedButton(color: Colors.transparent, elevation: 0.0, highlightElevation: 0.0, splashColor: Colors.red, child: new Text(exitButtonText, style: new TextStyle(fontSize: 23.0, fontFamily: "Quicksand")), onPressed: (){
                        exit(0);
                      }),
                    ),
                  ]
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}
