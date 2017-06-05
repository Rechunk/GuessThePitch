import 'package:flutter/material.dart';
import "options.dart";
import "countdown.dart";
import "route.dart";
import "grid.dart";
import "config.dart";
import "help.dart";

class Menu extends StatefulWidget {
  @override
  _Menu createState() => new _Menu();
}

class _Menu extends State<Menu> {

  @override
  build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("Soundy", style: new TextStyle(fontSize: 60.0, height: 2.0, letterSpacing: 5.0, color: new Color(0xFF95989A))),
            new RaisedButton(color: Colors.transparent, elevation: 0.0, highlightElevation: 0.0, splashColor: Colors.red, child: new Text("Play", style: new TextStyle(fontSize: 20.0)), onPressed: (){

              Navigator.push(context, new CustomRoute(
                  rightToLeft,
                  builder: (_) => new Grid()
              ));
            }),
            new RaisedButton(color: Colors.transparent, elevation: 0.0, highlightElevation: 0.0, splashColor: Colors.red, child: new Text("Options", style: new TextStyle(fontSize: 20.0)), onPressed: (){
              Navigator.push(context, new CustomRoute(
                  leftToRight,
                  builder: (_) => new Options()
              ));
            }),
            new RaisedButton(color: Colors.transparent, elevation: 0.0, highlightElevation: 0.0, splashColor: Colors.red, child: new Text("Help", style: new TextStyle(fontSize: 20.0)), onPressed: (){
              Navigator.push(context, new CustomRoute(
                  leftToRight,
                  builder: (_) => new Help()
              ));
            }),
            new RaisedButton(color: Colors.transparent, elevation: 0.0, highlightElevation: 0.0, splashColor: Colors.red, child: new Text("Exit", style: new TextStyle(fontSize: 20.0)), onPressed: (){

            }),
          ]
        ),
      ),
    );
  }
}
