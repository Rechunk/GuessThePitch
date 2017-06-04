import 'package:flutter/material.dart';
import "soundManager.dart";
import 'package:audioplayer/audioplayer.dart';
import "dart:async";

class Grid extends StatefulWidget {
  @override
  _Grid createState() => new _Grid();
}

class _Grid extends State<Grid> {

  List<int> values = [0,0,0,0,0];
  List<Color> colors = new List.generate(5, (i) => Colors.blue);
  List<Widget> sliders = [];

  @override
  void initState(){
    super.initState();
    new Timer(new Duration(seconds: 1), (){
      playSequence(random: true);
    });
  }

  List<Widget> buildSlides(){
    List<Widget> sliders = [];
    for (int i = 0; i < 5; i++){
      sliders.add(new Slider(
        value: values[i].toDouble(),
        min: 0.0,
        max: 5.0,
        divisions: 5,
        label: '${values[i]}',
        activeColor: colors[i],
        onChanged: (double newValue) {
          setState(() {
            values[i] = newValue.round();
          });
        },
      ));
    }
    return sliders;
  }

  getDifferenceToExactResult(){
    List<int> differences = [];
    for (int i = 0; i < values.length; i++){
      differences.add(randomFrequencies[i] - values[i]);
    }
    return differences;
  }

  void displayResults(var results){
    for (int i = 0; i < results.length; i++){
      if (results[i] != 0){
        setState((){
          values[i] += results[i];
          colors[i] = (results[i] == 1) ? Colors.orange : Colors.red;
        });
      }
    }
  }

  @override
  build(BuildContext context){
    sliders = buildSlides();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Game"),
        backgroundColor: Colors.red,
        elevation: 1.0,
      ),
      body: new Container(
        child: new ListView(
          padding: new EdgeInsets.all(50.0),
          children: [
            new Column(
              children: sliders,
            ),
            new Container(
              margin: new EdgeInsets.all(20.0),
              child: new Column(
                children: [
                  new RaisedButton(
                    child: new Text("Done", style: new TextStyle(fontSize: 20.0)),
                    onPressed: () {
                      var results = getDifferenceToExactResult();
                      displayResults(results);
                    },
                  ),
                  new RaisedButton(
                    child: new Text("Replay", style: new TextStyle(fontSize: 20.0)),
                    onPressed: () {
                      playSequence(random: false);
                    },
                  ),
                ]
              ),
            ),
          ]
        )
      ),
    );
  }
}

/*
*/
