import 'dart:ui' as prefix1;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart' as prefix0;
import 'dart:math';
import 'package:intl/intl.dart';

class Prediction extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Prediction> {
  @override
  Widget build(BuildContext context) {

    var width_=MediaQuery.of(context).size.width;
    var height_=MediaQuery.of(context).size.height;
    var rnd = new Random();
    var now = new DateTime.now();
    var data = [

      //TODO: the data in the DB should be added here (and in line 184 (PM2.5) and 213 (PM10) and 255 (AQI)) instead of the random values
      Chrt("O3", rnd.nextInt(100), Colors.white),
      Chrt("NO2", rnd.nextInt(100), Colors.white),
      Chrt("NO", rnd.nextInt(100), Colors.white),
      Chrt("SO2", rnd.nextInt(100), Colors.white),
      Chrt("CO", rnd.nextInt(100), Colors.white),
      Chrt("NH3", rnd.nextInt(100), Colors.white),
    ];
    var series = [
      charts.Series(
        domainFn: (Chrt chrt, _) => chrt.x,
        measureFn: (Chrt chrt, _) => chrt.y,
        id: 'Chrt',
        data: data,
        colorFn: (Chrt chrt, _) => chrt.color,
      )
    ];

    var chrt = charts.BarChart(
      series,
      vertical: false,
    );

    return new Scaffold(
      appBar:  new AppBar(
          backgroundColor: Color.fromRGBO(66, 76, 88, 1),
          title: new Text('CleanAir',
            style: TextStyle( fontWeight: FontWeight.bold,fontSize: 24),
      ),
           leading: Icon(
          Icons.send,
          textDirection: prefix0.TextDirection.rtl,
        ),
        actions: <Widget>[
            new IconButton( icon: new Icon(Icons.settings),iconSize: 35, color: Colors.white, onPressed: () => {}, ),
           ],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(children: <Widget>[
        Container(
          height: 45.0,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xffafb7c2),
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 12.0),
                    blurRadius: 12.0),
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0,
                )
              ]),
          child: Center(
            child: Text(
              "Prédiction sur la qualité de l'air",
              style: TextStyle(
                fontFamily: "RobotoSlab",
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xff2ac6dc),
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 12.0),
                    blurRadius: 12.0),
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, -10.0),
                  blurRadius: 10.0,
                )
              ]),
          height: height_/2,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:200.0),
                child: Text( 
                  // TODO: the date here should be the date selected in the select date page and not today 
                  now.day.toString()+"/"+now.month.toString()+"/"+ now.year.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
              Text(
                "Pourcentage des gaz polluants",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "RobotoSlab",
                    color: Colors.white),
              ),
              SizedBox(
                height: height_/3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: chrt,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Padding( // "Polluants Solides"
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Polluants Solides",
                style: TextStyle(
                  fontFamily: "RobotoSlab",
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff2ac6dc),
                ),
              ),
            ),
            Padding( // PM2.5 and PM10
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Padding( 
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container( 
                      child: Column( // PM2.5
                        children: <Widget>[
                          Padding( // PM2.5
                            padding: const EdgeInsets.only(right :85.0),
                            child: Text("PM2.5",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),),
                          ),
                          Padding( // 10 µg/meter cube
                            padding: const EdgeInsets.only(right: 70.0,top: 0),
                            // the amount of particules PM2.5 should be found in the DB
                            child: Text("10 μg/m3",style: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                            ),),
                          ),
                        ],
                      ),
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Color(0xff2ac6dc), width: 10)),
                      ),
                    ),
                  ),
                  Container( // PM10
                    child: Column(
                      children: <Widget>[
                        Padding( // PM10
                          padding: const EdgeInsets.only(right :40.0),
                          child: Text("PM10",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                        ),
                        Padding( // 10 µg/meter cube
                          padding: const EdgeInsets.only(right: 10.0,top: 0),
                          child: Text("10 μg/m3",style: TextStyle(
                            fontSize: 15,
                            color: Colors.black38,
                          ),),
                        ),
                      ],
                    ),
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Color(0xff2ac6dc), width: 10)),
                    ),
                  ),

                ],
              ),
            ),
            // "Indice de la qualité de l'Air"
            Padding( // title
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Indice de la qualité de l'Air",
                style: TextStyle(
                  fontFamily: "RobotoSlab",
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff2ac6dc),
                ),
              ),
            ),
            Padding( // value of the AQI
              padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
              child: Container(
                height: 40.0,
                width: 60,
                decoration: BoxDecoration(
                    color: Color(0xff2ac6dc),
                    borderRadius: BorderRadius.circular(20.0),

                ),
                child: Center(
                  // the AQI should also be found in the DB
                  child: Text("45",style:TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
           /* Padding( // bookmark
              padding: const EdgeInsets.only(top: 8.0,left: 240, bottom: 20.0),
              child: Container(
                height: 40.0,
                width: 45,
                decoration: BoxDecoration(
                  color: Color(0xff2ac6dc),
                  borderRadius: BorderRadius.circular(20.0),

                ),
                child: Center(
                  child: Icon(Icons.turned_in,color: Colors.white,)
                ),
              ),
            ),*/
          ],
        ),
      ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.turned_in,color: Colors.white,),
        backgroundColor: Color(0xff2ac6dc),
      ),
    );
  }
}

class Chrt {
  final String x;
  final int y;
  final charts.Color color;

  Chrt(this.x, this.y, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
