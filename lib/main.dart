import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';


void main(){
runApp(new MaterialApp(
  home: new MyApp(),
));
}

class MyApp extends StatefulWidget{
@override
  _State createState() => new _State();
}

enum Answers{YES,NO,MAYBE}

class _State extends State<MyApp>{

  void _setValue1(String value) => setState(() => _value = value);


  Future  _askUser() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: const Text('Do You Like Flutter'),
            children: <Widget>[
              new SimpleDialogOption(
                onPressed: () { Navigator.pop(context, Answers.YES);},
                child: new Text('Yes!!!'),
              ),
              new SimpleDialogOption(
                onPressed: () { Navigator.pop(context, Answers.NO); },
                child: new Text('No!!!'),
              ),
              new SimpleDialogOption(
                onPressed: () { Navigator.pop(context, Answers.MAYBE); },
                child: new Text('Maybe!!'),
              ),
            ],
          );
        }
    )) {
      case Answers.YES:
      _setValue1("yes");
        break;
      case Answers.NO:
      _setValue1("No");
        break;
      case Answers.MAYBE:
        _setValue1("Maybe");
        break;
    }
  }



  Future<void> _showAlert(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new TextButton(onPressed:() => Navigator.pop(context),child: new Text("Click Me"))
          ]
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  void _showbar(){
    _scaffoldstate.currentState?.showSnackBar(new SnackBar(content: new Text("Hello Wold")));
  }



  List<BottomNavigationBarItem> _items = [];
  String _value = " ";
  int _index = 0;
  double _slider = 0.0;


  @override
  void initState() {
  _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.people), label:"People"));
  _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.people), label:"Weekend"));
  _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.people), label:"Message"));
  }

  void _showButton(){
    showModalBottomSheet <void>(
        context: context,
        builder: (BuildContext context){
            return new Container(
              padding: new EdgeInsets.all(15.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("Some info here", style: new TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                  new ElevatedButton(onPressed:() => Navigator.pop(context, "Do You Like Flutter?"), child:new Text("Close"))
                ],
              ),
            );
        }
    );
  }


  void _setValue(double _value) => setState(() => _slider = _value);


  int _num1 = 0;
  bool _value1 = false;
  bool _value2 = false;
  // int? _value1 = 0;
  // int? _value2 = 0;
  //
  // void _setValue1(int? value) => setState(() =>_value1 = value);
  // void _setValue2(int? value) => setState(() =>_value2 = value);

  // Widget makeRadios(){
  //   List<Widget> list = [];
  //   for(int i=0; i<3; i++){
  //     list.add(new Radio(
  //         value: i,
  //         groupValue:_value1,
  //         onChanged:_setValue1,
  //         activeColor: Colors.green,
  //     ));
  //   }
  //   Column column = new Column(children:list);
  //   return column;
  // }

  // Widget makeRadioTiles(){
  //   List<Widget> list = [];
  //   for(int i=0; i<3; i++){
  //     list.add(new RadioListTile(
  //         value: i,
  //         groupValue:_value2,
  //         onChanged:_setValue2,
  //         activeColor: Colors.green,
  //         controlAffinity: ListTileControlAffinity.trailing,
  //         title: new Text("Item ${i}"),
  //         subtitle: new Text("Sub Title"),
  //     ));
  //   }
  //
  //   Column column = new Column(children:list);
  //   return column;
  // }

  // void _value1Changed(bool? value) => setState(() => _value1 = value);
  // void _value2Changed(bool? value) => setState(() => _value2 = value);

  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);

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

  void _onPressed() => setState(() =>_value = new DateTime.now().toString());

  void _onClick(String value) => setState(() => _value = value);


  void _selectDate() async{
    DateTime? picked = await showDatePicker(
        context:context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2021),
        lastDate: new DateTime(2025)
    );
    if(picked != null) setState(() => _value = picked.toString());{
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key:_scaffoldstate,
      appBar: new AppBar(
        title: new Text("Hello Wold"),
        backgroundColor: Colors.red,
        actions:<Widget>[
          new IconButton(onPressed:_add, icon: new Icon(Icons.add)),
          new IconButton(onPressed:_sub, icon: new Icon(Icons.remove)),
        ],
      ),

      floatingActionButton: new FloatingActionButton(
          onPressed:_onPressed,
          backgroundColor: Colors.red,
          mini: true,
          child: new Icon(Icons.timer),
      ),

      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children:<Widget>[
              new Text("Hello Drawer"),
              new ElevatedButton(onPressed:() => Navigator.pop(context), child: new Text("Close"))
            ],
          ),
        ),
      ) ,

      persistentFooterButtons:<Widget> [
        new IconButton(onPressed:() => _onClick("Button 1"), icon: new Icon(Icons.timer)),
        new IconButton(onPressed:() => _onClick("Button 2"), icon: new Icon(Icons.people)),
        new IconButton(onPressed:() => _onClick("Button 3"), icon: new Icon(Icons.map)),
      ],

      bottomNavigationBar: new BottomNavigationBar(
          items:_items,
          fixedColor: Colors.blue,
          currentIndex:_index,
          onTap: (int item){
            setState(() {
              _index = item;
              _value = "Current value is ${_index.toString()}";
            });
        },
      ),


      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children:<Widget> [
              new Text(_num1.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37.0)),
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
              new Switch(value:_value1, onChanged:_onChanged1),
              new SwitchListTile(
                value:_value2,
                onChanged:_onChanged2,
                title: new Text("Hello World", style: new TextStyle(fontWeight:FontWeight.bold,color: Colors.red)),
            ),
            new Text("Value: ${(_slider * 100).round()}"),
            new Slider(value:_slider, onChanged:_setValue),
            new Text(_value),
            new RaisedButton(onPressed:_selectDate, child: new Text("Date Picker")),
              new ElevatedButton(onPressed:_showButton, child:new Text("Click Me for BottomSheet")),
              new RaisedButton(onPressed:_showbar, child: new Text("Click Me for SnackBar")),
              new RaisedButton(onPressed:() => _showAlert(context,"Do You Like Flutter"), child: new Text("Click Me for Alert ")),
              new ElevatedButton(onPressed:_askUser, child: new Text("Click Me Dialog")),


              // new Checkbox(value:_value1, onChanged:_value1Changed),
            //   new CheckboxListTile(
            //       value:_value2,
            //       onChanged:_value2Changed,
            //       title: new Text("Hello Wold"),
            //       controlAffinity: ListTileControlAffinity.leading,
            //       subtitle: new Text("Subtitle"),
            //       secondary: new Icon(Icons.archive),
            //       activeColor: Colors.red,
            //   )
            ],
          ),
        ),
      ),
    );
  }
}
