import 'package:flutter/material.dart';
import "config.dart";

class Help extends StatelessWidget {

  final textStyle = new TextStyle(fontSize: 20.0);

  @override
  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Help"),
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