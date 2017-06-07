import 'package:flutter/material.dart';
import "config.dart";

class Help extends StatelessWidget {

  final textStyle = new TextStyle(fontSize: 20.0, fontFamily: "Quicksand");
  final helpText = "The Game starts as soon as you hit 'Play'. \n\nIn the first round,"
      "you will only see one slider. A sound will play and you have to guess the frequency "
      "of the sound by adjusting the slider from left(low frequency) to right(high frequency).\n\n"
      "Click on the checkmark as soon as you are done. The next round you will need to adjust one more slider "
      "and therefor, two sounds play. This continues upto five sliders. From this point on, fight for your "
      "new highscore!";

  @override
  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Help", style: new TextStyle(fontFamily: "Quicksand")),
        leading: new Container(),
        backgroundColor: mainColor,
        actions: [
          new IconButton(
          icon: new Icon(
              Theme.of(context).platform == TargetPlatform.iOS ? Icons.arrow_forward_ios : Icons.arrow_forward,
          ), onPressed: () {
              Navigator.pop(context);
          })],
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: new Icon(Icons.volume_up, color: Colors.grey, size: 100.0),
              ),
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