import 'package:flutter/material.dart';

var pagelist=[
  PageModel(
    id:0,
    couleur:Color(0xffd68e4f),
    valeurControler: TextEditingController(text: ""),
    title: "Quel es le type de votre véhicule ?",
    istextField: false,
    hint: "type de vehicule",
    choix: [
      DropdownMenuItem(value: "Les auto berlines",child: Text("Les auto berlines"),),
      DropdownMenuItem(value: "Les automobiles Break",child: Text("Les automobiles Break"),),
      DropdownMenuItem(value: "Les voitures monospace",child: Text("Les voitures monospace"),),
      DropdownMenuItem(value: "Les citadines",child: Text("Les citadines"),),
      DropdownMenuItem(value: "Les cabriolets et coupé",child: Text("Les cabriolets et coupé"),),
      DropdownMenuItem(value: "Le Pick up",child: Text("Le Pick up"),),
      DropdownMenuItem(value: "Le 4x4",child: Text("Le 4x4"),),
      DropdownMenuItem(value: "Les utilitaires et fourgonnettes",child: Text("Les utilitaires et fourgonnettes"),),
    ],
  ),
  PageModel(
    id: 1,
    hint: "le modele de véhicule",
    couleur:Color(0xff2ac6dc),
    valeurControler: TextEditingController(text: ""),
    title: "Quel est le modele de votre véhicule ?",
    istextField: true,
    isTwoFields: false,
    isNumber: false,
  ),
  PageModel(
    id: 2,

    couleur:Color(0xff31c3b6),
    valeurControler: TextEditingController(text: ""),
    title: "Quel est le type de carburant que vous utilisez ?",
    hint: "le type de carburant",
    choix: [
      DropdownMenuItem(value: "Hybride",child: Text("Hybride"),),
      DropdownMenuItem(value: "Essence",child: Text("Essence"),),
      DropdownMenuItem(value: "Électrique",child: Text("Électrique"),),
      DropdownMenuItem(value: "Diesel",child: Text("Diesel"),),
      DropdownMenuItem(value: "Sans plomb",child: Text("Sans plomb"),),
      DropdownMenuItem(value: "Super",child: Text("Super"),),
      DropdownMenuItem(value: "Sirgaz",child: Text("Sirgaz"),),
    ],
    istextField: false,
  ), PageModel(
    id: 3,
    hint: "durée d'utilisation",
    couleur:Color(0xffd68e4f),
    valeurControler: TextEditingController(text: ""),
    title: "depuis combien d'ans vous conduisez votre véhicule ?",
    istextField: true,
    isTwoFields: false,
    isNumber: true,
  ),
  PageModel(
    id: 4,
    couleur:Color(0xff2ac6dc),
    valeurControler: TextEditingController(text: ""),
    title: "est-ce que votre véhicule est équipé de catalyseur ?",
    istextField: false,
    hint: "équipé de catalyseur ?",
    choix: [
      DropdownMenuItem(value: "Oui",child: Text("Oui"),),
      DropdownMenuItem(value: "Non",child: Text("Non"),),
     ],
  ),
  PageModel(
    id:5,
    hint: "le fabricant de véhicule",
    couleur:Color(0xff31c3b6),
    valeurControler: TextEditingController(text: ""),
    title: "Qui est le fabricant de votre véhicule ?",
    istextField: true,
    isTwoFields: false,
    isNumber: false,
  ),
  PageModel(
    id: 6,
    couleur:Color(0xffd68e4f),
    valeurControler: TextEditingController(text: ""),
    valeurControler2: TextEditingController(text: ""),
    title: "à quelle fréquence utilisez-vous votre véhicule ?",
    istextField: true,
    isTwoFields: true,
    isNumber: true,
    hint: "Jours par semaine",
    hint2: "Heurs par jour"

  ),
  PageModel(
    id: 7,
    couleur:Color(0xff2ac6dc),
    hint: "nombre de cylindres",
    valeurControler: TextEditingController(text: ""),
    title: "combien de cylindres contient-il l’engin de votre véhicule ?",
    istextField: true,
    isTwoFields: false,
    isNumber: true,


  ),
];



class PageModel {
  int id;
  var title;
  var valeur;
  var valeur2;
  Color couleur ;
  bool isNumber=true;
  bool istextField =true ;
  bool isTwoFields=true;
  List<DropdownMenuItem<String>> choix=[];
  var hint;
  var hint2;
  var selectedValue;
  var valeurControler =new TextEditingController();
  var valeurControler2 =new TextEditingController();
  PageModel({ this.title,
    this.valeur,
    this.valeurControler,
    this.choix,
    this.istextField,
    this.couleur,
    this.selectedValue,
    this.hint,
    this.id,
  this.isNumber,
  this.isTwoFields,
  this.hint2,
  this.valeurControler2,
  this.valeur2});
}