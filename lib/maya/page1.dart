import 'package:flutter/material.dart';


class DatePick extends StatefulWidget {
  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(66, 76, 88,1),
        title: Text("Clean Air"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings,color: Colors.white,),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Theme(
            data: ThemeData(
              accentColor: Color.fromRGBO(49, 195, 182,1),
              primaryColor: Color.fromRGBO(49, 195, 182,1),
            ),
            child: Builder(
              builder: (context)=>
                  RaisedButton(
                      child: Text("Pick a date"),
                      onPressed: (){
                        showDatePicker(
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
    );
  }
}
