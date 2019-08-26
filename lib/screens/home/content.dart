import 'package:flutter/material.dart';
import 'package:projet_1cs/screens/home/volet.dart';
import 'package:projet_1cs/gps/appGPS.dart';
import 'package:projet_1cs/screens/formulaire/formulaire.dart';

class Content extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width_=MediaQuery.of(context).size.width;
    var height_=MediaQuery.of(context).size.height;
    return new SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        new Flexible(
            child: new Center(
                child: new Container(
                    height: height_,
                    child: GridView.count(
                      padding: const EdgeInsets.fromLTRB(20.0,40.0,20.0,20.0),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Volet(new  Icon( Icons.add_location,  ),Color.fromRGBO(246, 142, 79, 0.1),Color.fromRGBO(246, 142, 79,0.8), "Qualité de l'air en temps réel\n", ()=>AppGPS()),
                        Volet(new  Icon( Icons.assessment,  ),Color.fromRGBO(49, 195, 182, 0.1), Color.fromRGBO(49, 195, 182, 0.8),"Prédiction sur la qualité de l'air", null),
                        Volet(new  Icon( Icons.chrome_reader_mode,  ),Color.fromRGBO(42, 198, 220, 0.1),Color.fromRGBO(42, 198, 220, 0.8), "Articles informatifs\n", null),
                        Volet(new  Icon( Icons.directions_car,  ),Color.fromRGBO(175, 183, 194, 0.1), Color.fromRGBO(175, 183, 194, 0.8),"Mon véhicule et la polution?\n", ()=>Formulaire()),
                      ],
                    )))),

      ]),
    );
  }
}

