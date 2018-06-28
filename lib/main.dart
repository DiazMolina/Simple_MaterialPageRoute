import 'package:flutter/material.dart';
import 'dart:async';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Pantallas',
      
      home: new second(),
    );
  }
}

class second extends StatefulWidget {
  @override
  _secondState createState() => _secondState();
}


class _secondState extends State<second> {
  var _nameFieldController = new TextEditingController();

  Future _gotoNextScreen() async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute(builder: (BuildContext context){
          return new  NextScreen(name: _nameFieldController.text);
        })
    ); if(results != null ){

      _nameFieldController.text = results['info'].toString();
    }else{
      print('noting');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Primer pagina'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _nameFieldController,
              decoration:  new InputDecoration(
                labelText: "Escribe tu nombre"
              ),
            ),

          ),

          new ListTile(
            title: new RaisedButton(
              child: new Text("Enviar"),
                onPressed: () {_gotoNextScreen();}),
          )
        ],
      ),
    );
  }
}



class NextScreen extends StatefulWidget {
  final String name;
  NextScreen({this.name});

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var _backTextFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Second Screen'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title:  new Text('${widget.name}'),
            ),
            new ListTile(
              title:  new TextField(
                controller: _backTextFieldController,
              ),
            ),
            new ListTile(
              title: new FlatButton(onPressed: (){
                Navigator.pop(context,{
                  'info': _backTextFieldController.text
                });
              },
                  child: new Text('send data back')),
            )
          ],
        ),
      ),
//      body: new ListTile(
//        title: new Text('${widget.name}'),
//      ),
    );
  }
}
