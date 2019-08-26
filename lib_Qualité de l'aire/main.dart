import 'dart:ui' as prefix1;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart' as prefix0;
import 'dart:math';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  //To Do
  Widget build(BuildContext context) {
    var rnd = new Random();
    var now = new DateTime.now();
    var data = [
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
      appBar: new AppBar(
        leading: Icon(
          Icons.send,
          textDirection: prefix0.TextDirection.rtl,
        ),
        backgroundColor: Color(0xff424c58),
        title: Row(
          children: <Widget>[
            Text(
              "Clean Air",
              style: TextStyle(
                fontSize: 26,
                fontFamily: "RobotoSlab",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: Icon(
                Icons.settings,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
      body: Column(children: <Widget>[
        Container(
          height: 55.0,
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
                  offset: Offset(0.0, -10.0),
                  blurRadius: 10.0,
                )
              ]),
          child: Center(
            child: Text(
              "Qualité de l'Air en Temps Réel",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xff31c3b6),
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
          height: 250,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 260.0),
                child: Text(
                  now.day.toString() +
                      "/" +
                      now.month.toString() +
                      "/" +
                      now.year.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Roboto",
                      color: Colors.white),
                ),
              ),
              Text(
                "Pourcentage des gaz polluants",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Roboto",
                    color: Colors.white),
              ),
              SizedBox(
                height: 200,
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Polluants Solides",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  color: Color(0xff31c3b6),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right :85.0),
                            child: Text("PM2.5",style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 75.0,top: 0),
                            child: Text("10 μg/m",style: TextStyle(
                              fontSize: 15,
                              color: Colors.black26,
                            ),),
                          ),
                        ],
                      ),
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Color(0xff31c3b6), width: 10)),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right :30.0),
                          child: Text("PM2.5",style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0,top: 0),
                          child: Text("10 μg/m",style: TextStyle(
                            fontSize: 15,
                            color: Colors.black26,
                          ),),
                        ),
                      ],
                    ),
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Color(0xff31c3b6), width: 10)),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Indice de la qualité de l'Air",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  color: Color(0xff31c3b6),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 40.0,

                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xff31c3b6),
                  borderRadius: BorderRadius.circular(20.0),

                ),
                child: Center(
                  child: Text("45",style:TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 260),
              child: Container(
                height: 40.0,

                width: 45,
                decoration: BoxDecoration(
                  color: Color(0xff31c3b6),
                  borderRadius: BorderRadius.circular(20.0),

                ),
                child: Center(
                    child: Icon(Icons.turned_in,color: Colors.white,)
                ),
              ),
            ),
          ],
        ),
      ]),
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
