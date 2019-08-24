import 'package:flutter/material.dart';

class selectPlace extends StatefulWidget {
  @override
  _selectPlaceState createState() => _selectPlaceState();
}

class _selectPlaceState extends State<selectPlace> {
String _place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         bottom:PreferredSize(
             child: Container(
                 width: MediaQuery.of(context).size.width,
                 height: 50.0,
                 color:Color.fromRGBO(175, 183, 194,1),
                 child:
                 Center(child:
                 Text("Qualité de l'air en temps réel",
                   style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
                 ))),
             preferredSize: Size(50, 50)),
        backgroundColor: Color.fromRGBO(66, 76, 88,1),
        title: Text("Clean Air"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings,color: Colors.white,),
          )
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.gps_fixed,size: 150.0,color: Color.fromRGBO(246, 142, 79, 1),),
          Text("Utiliser le GPS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color:Color.fromRGBO(66, 76, 88,1) ),),
          Text("Autorisez  Clean Air à acceder a vos données d'emplacement afin de recevoir"
          "des informations plus adaptées",style: TextStyle(
             color: Color.fromRGBO(66, 76, 88,1)
          ), textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
                color: Color.fromRGBO(246, 142, 79, 1),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(50.0),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: (){
                  _placeAlert();
                    },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.location_on,color:Colors.white,),
                      ),
                      Text(
                        "Ma position actuelle",
                        style: TextStyle(color: Colors.white,fontSize: 15.0),
                      ),
                    ],
                  ),
                )),
          ),
          Text("Selectionner un emplacement",style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(66, 76, 88,1)),)



        ],
      ),
    );
  }

  void _placeAlert() {
    var _formKey = GlobalKey<FormState>();
    var alert = AlertDialog(
      title: Text("Choisir un emplacement"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      content: Form(
          key: _formKey,
          child: TextFormField(
            onSaved: (value) {
              _place = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "Choisissez un emplacement";
              }
            },
            decoration: InputDecoration(
              labelText: "emplacement",
              //border: InputBorder.none
            ),
          )),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Annuler")),
        FlatButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.pop(context);
              }
            },
            child: Text("Ok")),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

}
