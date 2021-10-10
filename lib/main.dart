import 'package:flutter/material.dart';


void main(){
runApp(new MaterialApp(
  home: new MyApp(),
));
}

class MyApp extends StatefulWidget{
@override
  _State createState() => new _State();
}

class _State extends State<MyApp>{

  String _value = "Hello Wold";

  void _onPressed(){
    setState(() {
      _value = "My Name is Randil";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name here"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: [
              new Text(_value),
              new RaisedButton(onPressed:_onPressed, child: new Text("Click Me"))
            ],
          ),
        ),
      ),
    );
  }
}
