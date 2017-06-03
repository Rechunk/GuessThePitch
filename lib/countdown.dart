import 'package:flutter/material.dart';
import 'package:countdown/countdown.dart';

class Countdown extends StatefulWidget {
  @override
  _Countdown createState() => new _Countdown();
}

class _Countdown extends State<Countdown> {

  int val = 0;

  void countdown(){
    CountDown cd = new CountDown(new Duration(seconds: 4));

    cd.stream.listen((Duration d) {
      setState((){
        val = cd.remainingTime.inSeconds;
      });
    });

  }

  @override
  build(BuildContext context){
    countdown();
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new Text(val.toString(), style: new TextStyle(fontSize: 150.0)),
        ),
      ),
    );
  }
}