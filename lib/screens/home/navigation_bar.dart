import 'package:flutter/material.dart';

class Navigation_bar extends StatelessWidget{
  //double width = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width_=MediaQuery.of(context).size.width;
    var height_=MediaQuery.of(context).size.height;
    return Container(
     width: MediaQuery.of(context).size.width,
      height: 70.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () {},
              color: Color.fromRGBO(42, 198, 220, 1),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width_/3,
                    ),
                    Text(
                      "Lieux Favoris",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: RaisedButton(
              onPressed: () {},
              color: Color.fromRGBO(246, 142, 79, 1),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width_/3,
                    ),
                    Text(
                      "Articles Favoris",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: RaisedButton(
              onPressed: () {},
              color: Color.fromRGBO(49, 195, 182, 1),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.event,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width_/3,
                    ),
                    Text(
                      "Lieux Récents",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}