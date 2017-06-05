import 'package:flutter/material.dart';
import "config.dart";

class Help extends StatelessWidget {

  final textStyle = new TextStyle(fontSize: 20.0, fontFamily: "Quicksand");
  final helpText = "Das Spiel beginnt, sobald du auf 'Play' drückst. "
      "Innerhalb von einer Sekunde hörst du dann 5 Töne. Für jeden Ton steht "
      "einer der Schieberegler. Schätze ein, wie hoch jeweils die Töne waren, "
      "indem du sie einzeln bewegst. Drücke anschließend auf 'Done' und schaue "
      "dir deine Ergebnisse an!";

  @override
  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Help", style: new TextStyle(fontFamily: "Quicksand")),
        leading: new Container(),
        backgroundColor: mainColor,
        actions: [ new IconButton( icon: new Icon( Theme.of(context).platform == TargetPlatform.iOS ? Icons.arrow_forward_ios : Icons.arrow_forward), onPressed: () { Navigator.pop(context); })],
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Padding(
                padding: new EdgeInsets.all(20.0),
                child: new Text(helpText, style: textStyle),
              ),
            ]
          )
        ),
      )
    );
  }
}