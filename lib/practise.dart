import "package:flutter/material.dart";
import "config.dart";

class Playground extends StatefulWidget {
  @override
  _Playground createState() => new _Playground();
}

class _Playground extends State<Playground> {

  int currentValue = 0;

  @override
  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Help", style: new TextStyle(fontFamily: "Quicksand")),
        backgroundColor: mainColor,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Slider(
            value: currentValue.toDouble(),
            min: 0.0,
            max: 5.0,
            divisions: 5,
            label: '$currentValue',
            onChanged: (double newValue) {
              setState(() {
                currentValue = newValue.round();
              }
              );
            },
          ),
          new IconButton(
            icon: new Icon(Icons.volume_up),
            onPressed: (){

            }
          ),
        ]
      ),
    );
  }
}