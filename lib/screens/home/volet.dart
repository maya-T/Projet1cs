import 'package:flutter/material.dart';

class Volet extends StatelessWidget{
  var icon_name= new  Icon( Icons.add_location,  );
  var oval_color=Color.fromRGBO(246, 142, 79, 0.05);
  var border_color=Color.fromRGBO(246, 142, 79, 0.8);
  var text_content= "Qualité de l'air en temps réel";
  Function route;
  
  Volet(

      this.icon_name,
      this.oval_color,
      this.border_color,
      this.text_content,
      this.route,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    var width_=MediaQuery.of(context).size.width;
    var height_=MediaQuery.of(context).size.height;
    return new Container(
      padding: new EdgeInsets.all(0.0),
      decoration: new BoxDecoration(
        //color: Color.fromRGBO(246, 142, 79, 0.2),
        border: Border.all(color:  Color.fromRGBO(25, 25, 112, 0.1), width: 5.0),

        borderRadius: new BorderRadius.all(Radius.elliptical(30, 30)),
      ),
      alignment: FractionalOffset.center,
      child : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Container(
                margin: new EdgeInsets.all(0.0) ,
                height:height_/8,
                width:width_/4,
                decoration: new BoxDecoration(
                  color: oval_color,
                  border: Border.all(color: border_color, width: 3.0),

                  borderRadius: new BorderRadius.all(Radius.elliptical(250, 250)),
                ),

                child: new IconButton(
                    icon:icon_name,
                    padding: new EdgeInsets.all(0.0),
                    iconSize: 40,
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => route()),
                        );
                    })



            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7.0),
            width: width_/3.5,
            child: Text(
              text_content,
              style: TextStyle(color: border_color, fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
            ),
          ),
        ],

      ),

    );
  }

}