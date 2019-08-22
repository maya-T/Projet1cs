import 'package:flutter/material.dart';
import 'package:projet_1cs/screens/home/content.dart';
import 'package:projet_1cs/screens/home/navigation_bar.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Center(
          child: Content(),
        ),
        bottomNavigationBar: Navigation_bar(),
      );
  }
}

/***************************************************** */
/*import 'package:flutter/material.dart';
void main() => runApp(new MyApp());


class Element extends StatelessWidget{
  var icon_name= new  Icon( Icons.add_location,  );
  var oval_color=Color.fromRGBO(246, 142, 79, 0.05);
  var border_color=Color.fromRGBO(246, 142, 79, 0.8);
  var text_content= "Qualité de l'air en temps réel";
  Element(

      this.icon_name,
      this.oval_color,
      this.border_color,
      this.text_content,
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

                  borderRadius: new BorderRadius.all(Radius.elliptical(300, 300)),
                ),

                child: new IconButton(
                    icon:icon_name,
                    padding: new EdgeInsets.all(0.0),
                    color:Color.fromRGBO(255, 255, 255, 1),
                    iconSize: 50,
                    onPressed: null)



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
              maxLines: 5,
            ),
          ),
        ],

      ),



    );
  }

}

class Content extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width_=MediaQuery.of(context).size.width;
    var height_=MediaQuery.of(context).size.height;
    return new SafeArea(
      child: Column(children: [

        new Expanded(
            child: new Center(
                child: new Container(
                    height: height_/1.9,
                    child: GridView.count(
                      padding: const EdgeInsets.all(20.0),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Element(new  Icon( Icons.add_location,  ),Color.fromRGBO(246, 142, 79, 0.1),Color.fromRGBO(246, 142, 79,0.8), "Qualité de l'air en temps réel\n"),
                        Element(new  Icon( Icons.assessment,  ),Color.fromRGBO(49, 195, 182, 0.1), Color.fromRGBO(49, 195, 182, 0.8),"Prédiction sur la qualité de l'air"),
                        Element(new  Icon( Icons.chrome_reader_mode,  ),Color.fromRGBO(42, 198, 220, 0.1),Color.fromRGBO(42, 198, 220, 0.8), "Articles informatifs\n"),
                        Element(new  Icon( Icons.directions_car,  ),Color.fromRGBO(175, 183, 194, 0.1), Color.fromRGBO(175, 183, 194, 0.8),"Contribution de mon véhicule à la polution"),
                      ],
                    )))),

      ]),
    );
  }
}

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
        body: Center(
          child: Content(),
        ),
        bottomNavigationBar: Navigation_bar(),
      ),
    );
  }
}

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

*/
