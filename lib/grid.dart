import 'package:flutter/material.dart';
import "soundManager.dart";
import 'package:audioplayer/audioplayer.dart';
import "dart:async";
import "route.dart";
import "config.dart";

class Grid extends StatefulWidget {
  @override
  _Grid createState() => new _Grid();
}

class _Grid extends State<Grid> {

  List<int> values = [0,0,0,0,0];
  List<Color> colors = new List.generate(5, (i) => Colors.blue);
  List<Widget> sliders = [];
  String resultsText = "";
  AnimationController controller;
  int score = 0;

  @override
  void initState(){
    super.initState();
    revealSequence();
  }

  void revealSequence(){
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

  void correctSliders(var results){
    for (int i = 0; i < results.length; i++){
      if (results[i] != 0){
        setState((){
          values[i] += results[i];
          colors[i] = (results[i] == 1) ? Colors.orange : Colors.red;
        });
      }
    }
  }

  void resetSliders(){
    for (int i = 0; i < values.length; i++){
      setState((){
        values[i] = 0;
      });
    }
  }

  void calculateResults(){

  }

  bool madeMistake(results){
    for (var elem in results){
      if (elem != 0){
        return true;
      }
    }
    return false;
  }

  @override
  build(BuildContext context){
    sliders = buildSlides();
    return new Scaffold(
      appBar: new AppBar(
        leading: new Container(),
        title: new Text("Guess The Pitch!"),
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
                  new IconButton(
                    icon: new Icon(Icons.check),
                    iconSize: 50.0,
                    onPressed: () {
                      var results = getDifferenceToExactResult();
                      if (madeMistake(results)){
                        correctSliders(results);
                        resultsText = "You made it through $score rounds!";
                        new Timer(new Duration(seconds: 2), (){
                          Navigator.of(context).pop();
                        });
                      }
                      else {
                        score++;
                        resetSliders();
                        revealSequence();
                      }
                    },
                  ),
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child: new Text(resultsText, style: new TextStyle(fontSize: 20.0)),
                  )
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
