import 'package:blue_design/utils/app_strings.dart';
import 'package:blue_design/screens/home.dart';
import 'package:flutter/material.dart';
void main(){

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override 
  Widget build(BuildContext context){
     return MaterialApp(
      debugShowCheckedModeBanner: false,
       title:AppStrings.appTitle,
       home:HomeScreen()
     );
  }
}