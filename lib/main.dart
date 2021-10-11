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

  String _value = " ";
  int _num1 = 0;

  void _onChange(String value){
    setState(() =>_value = "Change ${_value}");
  }

  void _onSubmit(String value){
    setState(() =>_value = "Submit ${_value}");
  }

  void _add(){
    setState(() {
      _num1++;
    });
  }

  void _sub(){
    setState(() {
      _num1--;
    });
  }

  void _onPressed(){
    setState(() {
      _value = new DateTime.now().toString();
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
              new TextField()

            ],
          ),
        ),
      ),
    );
  }
}
