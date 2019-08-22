import 'package:flutter/material.dart';
import 'package:projet_1cs/screens/home/home.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Welcome',
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(66, 76, 88, 1),
          title: new Text('CleanAir',
            style: TextStyle( fontWeight: FontWeight.bold,fontSize: 24),
      ),
          leading: new IconButton(icon: new Icon(Icons.send),iconSize: 35, color: Colors.white, onPressed: () => {},),
          actions: <Widget>[
            new IconButton( icon: new Icon(Icons.settings),iconSize: 35, color: Colors.white, onPressed: () => {}, ),
           ],
        ),
        body: Home(),
      ),
    );
  }
}


