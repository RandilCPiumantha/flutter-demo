import 'package:flutter/cupertino.dart';
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
  bool? _value1 = false;
  bool? _value2 = false;


  void _value1Changed(bool? value) => setState(() => _value1 = value);
  void _value2Changed(bool? value) => setState(() => _value2 = value);


  void _onChange(String value){
    setState(() =>_value = "Change ${value}");
  }

  void _onSubmit(String value){
    setState(() =>_value = "Submit ${value}");
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
            children:<Widget> [
              new Text(_value),
              new TextField(
                decoration: new InputDecoration(
                  labelText: 'Hello',
                  hintText: 'Hint',
                  icon: new Icon(Icons.people)
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: _onChange,
                onSubmitted: _onSubmit,
              ),
            new Checkbox(value:_value1, onChanged:_value1Changed),
              new Checkbox(value:_value2, onChanged:_value2Changed),
            ],
          ),
        ),
      ),
    );
  }
}
