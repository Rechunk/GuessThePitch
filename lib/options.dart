import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  @override
  _Options createState() => new _Options();
}

class _Options extends State<Options> {
  @override
  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Options"),
        leading: new Container(),
        actions: [ new IconButton( icon: new Icon( Theme.of(context).platform == TargetPlatform.iOS ? Icons.arrow_forward_ios : Icons.arrow_forward), onPressed: () { Navigator.pop(context); })],
      ),
      body: new Center(
        child: new Text("Options go here..."),
      ),
    );
  }
}
