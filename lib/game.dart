import 'package:flutter/material.dart';
import "soundManager.dart";
import "dart:async";
import "config.dart";

class Game extends StatefulWidget {
  @override
  _Game createState() => new _Game();
}

class _Game extends State<Game> {

  List<int> values = new List.generate(5, (i) => 0);
  List<Color> colors = new List.generate(5, (i) => Colors.blue);
  List<Widget> sliders = [];
  Widget sliderContainer;
  int amountOfSliders = 1;
  int score = 0;

  @override
  void initState(){
    super.initState();
    triggerRandomSequence();
  }

  void triggerRandomSequence(){
    new Timer(new Duration(seconds: 1), (){
      playSequence(amountOfSliders, random: true);
    });
  }

  void increaseSliderAmountUntilFive(){
    setState((){
      amountOfSliders += (amountOfSliders < 5) ? 1 : 0;
    });
  }

  @override
  build(BuildContext context){
    sliders = buildSliders(amountOfSliders);
    return new Scaffold(

      body: new Container(
          child: new ListView(
              padding: new EdgeInsets.all(50.0),
              children: [
                new Center(
                  child: new Text("$score", style: new TextStyle(fontFamily: "Coiny", fontSize: 60.0, color: mainColor))
                ),
                new Container(
                  height: 350.0,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: sliders,
                  )
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
                              new Timer(new Duration(seconds: 2), (){
                                Navigator.of(context).pop();
                              });
                            }
                            else {
                              score++;
                              resetSliders();
                              increaseSliderAmountUntilFive();
                              triggerRandomSequence();
                            }
                          },
                        ),
                        new Padding(
                          padding: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                        )
                      ]
                  ),
                ),
              ]
          )
      ),
    );
  }

  List<Widget> buildSliders(int amount){
    List<Widget> sliders = [];
    for (int i = 0; i < amount; i++){
      sliders.add(
        new Slider(
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
        )
      );
    }
    return sliders;
  }

  getDifferenceToExactResult(){
    List<int> differences = [];
    for (int i = 0; i < sliders.length; i++){
      differences.add(randomFrequencies[i] - values[i]);
    }
    return differences;
  }

  void correctSliders(var differences){
    for (int i = 0; i < differences.length; i++){
      if (sliderIsInWrongPosition(differences[i])){
        setState((){
          values[i] += differences[i];
          colors[i] = (differences[i] == 1) ? Colors.orange : Colors.red;
        });
      }
    }
  }

  bool sliderIsInWrongPosition(int difference){
    return (difference == 0) ? false : true;
  }

  void resetSliders(){
    for (int i = 0; i < sliders.length; i++){
      setState((){
        values[i] = 0;
      });
    }
  }

  bool madeMistake(results){
    for (var elem in results){
      if (elem != 0){
        return true;
      }
    }
    return false;
  }
}

/*
*/
