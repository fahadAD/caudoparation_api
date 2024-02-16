import 'package:caud_project_api/user_test.dart';
import 'package:flutter/material.dart';

import 'CAUD_oparation/home.dart';

void main() {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.blue)),
       home: HomePage(),
     );
   }
 }

