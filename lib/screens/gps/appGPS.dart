import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projet_1cs/screens/tempsReel/tempsReel.dart';

class AppGPS extends StatefulWidget { @override
_GPSState createState() => _GPSState();}

class _GPSState extends State<AppGPS> {
  String _place='OuedSmar';
  bool enabled  ;
  void getStateofgps() async {
    ServiceStatus serviceStatus = await PermissionHandler().checkServiceStatus(PermissionGroup.location);
     enabled = (serviceStatus == ServiceStatus.enabled);
    print("${enabled}") ;
  }
  @override
  Widget build(BuildContext context) {
    return
      OverlaySupport(
        child: new MaterialApp(
            home: new Scaffold(

              appBar: new AppBar(
          backgroundColor: Color.fromRGBO(66, 76, 88, 1),
          title: new Text('CleanAir',
            style: TextStyle( fontWeight: FontWeight.bold,fontSize: 24),
      ),
          leading: Icon(
          Icons.send,
          textDirection: TextDirection.rtl,
        ),
        actions: <Widget>[
            new IconButton( icon: new Icon(Icons.settings),iconSize: 35, color: Colors.white, onPressed: () => {},),
           ],
        ),


              body: new SingleChildScrollView(
                child: new Center(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        height: 45.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffafb7c2),
                            borderRadius: BorderRadius.circular(0.0),
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
                            "Qualité de l'air en temps réel",
                            style: TextStyle(
                              fontFamily: "RobotoSlab",
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      new Padding(child: new Icon(
                        Icons.gps_fixed, color: Color.fromRGBO(246, 142, 79,1), size: 125,),
                        padding: EdgeInsets.all(12.0),),
                      new Text("Utiliser le GPS", textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 30,
                            color: Color.fromRGBO(66, 76, 88, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto"),
                            ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0)),
                        new Text("Autoriser a ClainAir a acceder a vos données d'emplacement afin de reçevoir des informations plus adaptées sur la qualité de l'air",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            fontSize: 16, 
                            color:  Color.fromRGBO(66, 76, 88, 0.7),
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.0)
                          ),
                        new FlatButton.icon(onPressed: (){getStateofgps();
                        if(enabled) {
                          // naviguer a la page de statistique
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TempsReel()),
                          );
                        }
                          else {
                          showOverlayNotification((context) {
                            return Card(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: SafeArea(
                                child: new Center(
                                  child: ListTile(
                                    title: new Icon(Icons.gps_off,color : Color.fromRGBO(246, 142, 79,1),size:30),
                                    subtitle: Text('Veuillez activer le service de localisation',style: new TextStyle(fontSize: 15),),
                                    trailing: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          OverlaySupportEntry.of(context).dismiss();
                                        }),
                                  ),
                                ),
                              ),
                            );
                          },
                          duration: Duration(milliseconds: 4000));
                        }
                    },
                      color: Color.fromRGBO(246, 142, 79,1),
                      icon: new Icon(
                          Icons.map, size: 22, color: Colors.white),
                      label: new Text("Ma position actuelle",
                          style: new TextStyle(fontSize: 22,
                              color: Colors.white,
                              fontFamily: "Roboto")),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                          ),
                      new RaisedButton(onPressed: () {
                        _placeAlert(context);
                      },
                        child: new Text("Choisir un emplacement",
                          style: new TextStyle(
                              fontSize: 22,
                              fontStyle: FontStyle.normal,
                              color: Color.fromRGBO(66, 76, 88, 0.8),
                              fontFamily: "Roboto"),),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.white,
                        elevation: 0.0,),
                        Padding(
                          padding: EdgeInsets.only(top: 15.0)
                          ),
                    ], 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                ),
              ),

              /*    bottomNavigationBar: new BottomNavigationBar(items: <BottomNavigationBarItem> [
                new BottomNavigationBarItem(icon: new Icon( Icons.refresh,color: Colors.white,),title: new Text("Actualiser",style:TextStyle(color: Colors.white),)) ,
                new BottomNavigationBarItem(icon: new Icon( Icons.list,color: Colors.white),title: new Text("Option",style:TextStyle(color: Colors.white))) ,
                new BottomNavigationBarItem(icon: new Icon( Icons.exit_to_app,color: Colors.white),title: new Text("deconnexion",style:TextStyle(color: Colors.white))) ,

              ],backgroundColor: Colors.black87,), */

            )
        ),
      );
  }

_placeAlert(context) async {
  final List<String> _dropdownValues = ['OuedSmar', "Bab Ezzouar", 'El Moradia', 'El Harrach'];
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Choisir un emplacement'),
            content: DropdownButton(
              items: _dropdownValues
                  .map((value) => DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                  .toList(),
              onChanged: (String value) {
                setState(() {
                _place = value;
                });
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TempsReel()));
                
              },
              //value: _place,
              isExpanded: false,
              hint: Text('emplacement'),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
  /*void _placeAlert() {
    var alert = AlertDialog(
      title: Text("Choisir un emplacement"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      content: DropdownButton<String>(
        value: _place,
        onChanged: (String newValue) {
          setState(() {
            _place = newValue;
          });
        },
        items: <String>['OuedSmar', "Bab Ezzouar", 'El Moradia', 'El Harrach']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
          .toList(),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Annuler")),
        FlatButton(
            onPressed: () {
                Navigator.pop(context);
            },
            child: Text("Ok")),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }*/

}







