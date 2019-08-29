import 'package:flutter/material.dart';
import 'package:projet_1cs/screens/prediction/prediction.dart';
class DatePick extends StatefulWidget {
  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  Future<DateTime> dateFutur;  
  @override
  Widget build(BuildContext context) { 
  var height_=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff2ac6dc),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
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
              "Prédiction sur la qualité de l'air",
              style: TextStyle(
                fontFamily: "RobotoSlab",
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
            child: Center(
              child: Theme(
                data: ThemeData(
                  accentColor: Color.fromRGBO(49, 195, 182,1),
                  primaryColor: Color.fromRGBO(49, 195, 182,1),
                ),
                child: Builder(
                  builder: (context)=>
                      RaisedButton(
                          child: Text("Choisissez une date",style: new TextStyle(
                                  fontSize: 26,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff2ac6dc) ,
                                  fontFamily: "RobotoSlab"),),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.white,
                            //elevation: 0.0,
                            onPressed: (){
                            dateFutur = showDatePicker(
                                context: context,
                                initialDate: DateTime.now().add(Duration(seconds: 1)),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100)
                            );
                            })

                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => Prediction(dateFutur)));                
        },
        child: Icon(Icons.check,color: Color(0xff2ac6dc),),
        tooltip: dateFutur.toString(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
