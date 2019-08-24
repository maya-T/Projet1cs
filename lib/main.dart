import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'maya/page1.dart';
import 'maya/page2.dart';

void main() {
//  ThemeData theme=ThemeData();
//  print(theme.hintColor.toString());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
     MaterialApp(
//       theme: ThemeData(
//           accentColor:Color.fromRGBO(49, 195, 182,1)
//       ),
       debugShowCheckedModeBanner: false,
       home:SafeArea(child: selectPlace()),
     )
    );
  });
}