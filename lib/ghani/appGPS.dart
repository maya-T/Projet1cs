import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:permission_handler/permission_handler.dart';


class appGPS extends StatefulWidget { @override
_MyAppState createState() => _MyAppState();}

class _MyAppState extends State<appGPS> {
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
                backgroundColor: Colors.black54,
                leading: new Icon(
                  Icons.keyboard_return, color: Colors.white, size: 30,),
                title: new Text("ClainAir",
                    style: new TextStyle(fontSize: 30, color: Colors.white)),
                actions: <Widget>[
                  new Icon(Icons.settings)
                ],

              ),


              body: new SingleChildScrollView(
                child: new Center(
                  child: new Column(
                    children: <Widget>[
                      new Padding(child: new Card(child: new Text(
                        "Qualité de l'air en temps réel",
                        style: new TextStyle(fontSize: 32, color: Colors.white),),
                        color: Colors.black26,), padding: EdgeInsets.all(0.0),),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      new Padding(child: new Icon(
                        Icons.gps_fixed, color: Colors.orange, size: 220,),
                        padding: EdgeInsets.all(12.0),),
                      new Text("Utiliser le GPS", textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 30,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      new Text("Autoriser a ClainAir a acceder a vos données",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 17, color: Colors.black54,),),
                      new Text("d'emplacement afin de reçevoir des informations",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 17, color: Colors.black54,),),
                      new Text("plus adaptées sur la qualité de l'air",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 17, color: Colors.black54,),),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      new Icon(Icons.local_offer, size: 25, color: Colors.white),

                      new FlatButton.icon(onPressed: (){getStateofgps();
                      if(enabled) {}// naviguer a la page de statistique
                        else {
                        showOverlayNotification((context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: SafeArea(
                              child: new Center(
                                child: ListTile(
                             /*   leading: SizedBox.fromSize(
                                      size: const Size(60, 60),
                                      child: ClipOval(
                                          child: Container(
                                            color: Colors.black,
                                          ))), */
                                  title: new Icon(Icons.gps_off,color : Colors.orange,size:30),
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
                        }, duration: Duration(milliseconds: 4000));
                      }

                      },
                        color: Colors.orange,
                        icon: new Icon(
                            Icons.local_offer, size: 25, color: Colors.white),
                        label: new Text("Ma position actuelle",
                            style: new TextStyle(fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),),
                      new RaisedButton(onPressed: () {},
                        child: new Text("Choisir un emplacement",
                          style: new TextStyle(fontSize: 25),),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.white,
                        elevation: 0.0,)
                    ], mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
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
}







