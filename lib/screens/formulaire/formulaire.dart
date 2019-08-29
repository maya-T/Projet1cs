import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'package:gradient_text/gradient_text.dart';
import 'page_Indicator.dart';
import 'information.dart';
import 'package:projet_1cs/screens/contribution/contribution.dart';

class Formulaire extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Formulaire>  with TickerProviderStateMixin{
  PageController _controller;
  AnimationController animationController;
  Animation<double> _scaleAnim;
  Information info=new Information();
  int currentPage = 0;
  bool lastPage=false;
  bool allFilled=false;
  bool oneOrMoreEmpty=false;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
    animationController=AnimationController(duration: Duration(milliseconds: 300),vsync: this);
    _scaleAnim=Tween(begin: 0.6,end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  new AppBar(
          backgroundColor: Color.fromRGBO(66, 76, 88, 1),
          title: new Text('CleanAir',
            style: TextStyle( fontWeight: FontWeight.bold,fontSize: 24),
      ),
           leading: Icon(
          Icons.send,
          textDirection: TextDirection.rtl,
        ),
        actions: <Widget>[
            new IconButton( icon: new Icon(Icons.settings),iconSize: 35, color: Colors.white, onPressed: () => {}, ),
           ],
        ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            stops: [0.0, 1.0],
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[

              PageView.builder(

                itemCount: pagelist.length,
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    oneOrMoreEmpty=false;
                    allFilled=false;
                    currentPage = index;
                    if(currentPage==pagelist.length-1)
                      {lastPage=true;
                      animationController.forward();}
                    else{
                      lastPage=false;
                    }
                  });
                },
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[

                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          var page = pagelist[index];
                          var delta;
                          var y = 1.0;

                          if (_controller.position.haveDimensions) {
                            delta = _controller.page - index;
                            y = 1 - delta.abs().clamp(0.0, 1.0);
                          }
                          return Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Container(color: page.couleur,),
                              Padding(

                                padding: const EdgeInsets.only(bottom: 70),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[

                                    Container(

                                      margin: EdgeInsets.only(left: 0.0, bottom: 25.0),
                                      height: 100.0,
                                      child: Stack(
                                        children: <Widget>[

                                          Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Text(
                                              page.title,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 28.0,
                                                color: Colors.white,
                                                fontFamily: "Roboto",
                                                letterSpacing: 1.0,
                                              ),

                                          ),
                                          )],
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 0.0),
                                        child: Container(
                                          width:300.0,
                                          height:80.0,
                                          
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            border: Border.all(color: Colors.white,width: 1.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: page.istextField ? Row(children:[Container(
                                                width: page.isTwoFields ? 125.0 :  275,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      hintText: page.hint,
                                                      hintStyle: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 12.0,
                                                      )),
                                                  controller: page.valeurControler,
                                                  onSubmitted: (txt){
                                                  setState(() {
                                                    page.valeur=page.valeurControler;
                                                    switch (page.id)
                                                    {

                                                      case 1:
                                                        {
                                                          info.modeleVehicule=page.valeurControler.text;
                                                          break;
                                                        }

                                                      case 3:
                                                        {
                                                          info.dureeUtilisation=page.valeurControler.text;
                                                          break;
                                                        }
                                                      case 5:
                                                        {
                                                          info.fabricantVehicule=page.valeurControler.text;
                                                          break;
                                                        }
                                                      case 6:
                                                        {
                                                          info.frequenceUtilisation=page.valeurControler.text;
                                                          break;
                                                        }

                                                      case 7:
                                                        {
                                                          info.nbCylindre=page.valeurControler.text;
                                                          break;
                                                        }

                                                    }
                                                  });
                                                  page.valeurControler=page.valeur;
                                                },keyboardType: page.isNumber ? TextInputType.number: TextInputType.text,
                                                  style: TextStyle(color: Colors.black45) ,),
                                              ),
                                              page.isTwoFields ? Padding(
                                                padding: EdgeInsets.only(left: 20),
                                                  child: Container(
                                                  width:125.0,
                                                  child: TextField(
                                                decoration: InputDecoration(
                                                    hintText: page.hint2,
                                                    hintStyle: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12.0,
                                                    )),
                                                controller: page.valeurControler2,
                                                onSubmitted: (txt){
                                                  setState(() {
                                                    page.valeur2=page.valeurControler2;
                                                    info.frequenceUtilisation2=page.valeurControler2.text;
                                                  });
                                                  page.valeurControler=page.valeur;
                                                },keyboardType: page.isNumber ? TextInputType.number: TextInputType.text,
                                                style: TextStyle(color: Colors.black45) ,))):Container()
                                              ]):
                                                  DropdownButton<String>(
                                                    isExpanded:true,
                                                    style: TextStyle(color: Colors.black45),
                                                    hint: Text(page.hint),
                                                    iconEnabledColor: Colors.white,iconDisabledColor: Colors.white,
                                                    value: page.selectedValue,items: page.choix,onChanged: (v){
                                                    setState(() {
                                                      page.selectedValue=v;
                                                      switch (page.id)
                                                      {

                                                        case 0:
                                                          {
                                                            info.typrVehicule=v;
                                                            break;
                                                          }

                                                        case 2:
                                                          {
                                                            info.typeCarburant=v;
                                                            break;
                                                          }
                                                        case 4:
                                                          {
                                                            info.isCatalyseur=v;
                                                            break;
                                                          }

                                                      }
                                                    });
                                                  },),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  );
                },
              ),
              Positioned(
                left: 60.0,
                bottom: 100.0,
                child: Container(
                  width: 250.0,
                  child: PageIndicator(currentPage, pagelist.length),
                ),
              ),
              Positioned(
                right: 30.0,
                bottom: 30.0,
                child: ScaleTransition(
                  scale: _scaleAnim,
                  child: lastPage ? RaisedButton(
                    color: Colors.white,
                    child: Text("Valider"),
                    onPressed: ()
                    {
                      setState(() {
                        if( info.frequenceUtilisation=="" ||
                            info.isCatalyseur=="" ||
                            info.typeCarburant=="" ||
                            info.typrVehicule=="" ||
                            info.dureeUtilisation=="" ||
                            info.fabricantVehicule=="" ||
                            info.modeleVehicule=="" ||
                            info.nbCylindre=="" ||
                        info.frequenceUtilisation2=="") {

                          oneOrMoreEmpty=true;
                          if(allFilled) allFilled=false;
                        }

                        else {
                          if(oneOrMoreEmpty) oneOrMoreEmpty=false;
                          allFilled=true;
                        }
                        Navigator.push(
                             context, 
                            MaterialPageRoute(builder: (context) => Contribution()));
                      });

                    },
                  ):Container(),
                )
              ),
              Positioned(
                left: 20.0,
                bottom: 45.0,
                child: oneOrMoreEmpty ? Text("Veuillez remplir tout les champs",style: TextStyle(
                      color: Colors.red,
                    fontWeight: FontWeight.bold
                    ),):Container(),
              ),
              Positioned(
                left: 20.0,
                bottom: 45.0,
                child: allFilled ? Text("Votre reponse a été enregisté",style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                ),):Container(),
              ),
              Column(children: <Widget>[
                Container(
                  height: 45.0,
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
                      "Contribution à la pollution",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],),

            ],

          ),
        ),
      ),
    );
  }
}

