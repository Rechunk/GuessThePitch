import 'package:flutter/material.dart';
import "language.dart";

class Help extends StatelessWidget {

  final textStyle = new TextStyle(fontSize: 20.0, fontFamily: "Quicksand");

  @override
  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(helpButtonText, style: new TextStyle(fontFamily: "Quicksand")),
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
                padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: new Text(helpInternetText, style: new TextStyle(color: Colors.grey)),
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