import "package:flutter/material.dart";
import "game.dart";

class ScoreCounter extends StatefulWidget {
  @override
  _ScoreCounter createState() => new _ScoreCounter();
}

class _ScoreCounter extends State<ScoreCounter> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  @override
  build(BuildContext context){
    return new AnimatedBuilder(
      animation: _controller,
      child: new Container(width: 200.0, height: 200.0, color: Colors.green),
      builder: (BuildContext context, Widget child) {
        return new Text("$score", style: new TextStyle(fontFamily: "Coiny", fontSize: 60.0, color: mainColor));      },
    );
  }
}
//        return new Text("$score", style: new TextStyle(fontFamily: "Coiny", fontSize: 60.0, color: mainColor));
