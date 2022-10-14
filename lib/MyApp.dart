import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'CategoryScreen/CategoryPage.dart';
import 'HomeScreen/DashboardPage.dart';
import 'ProductScreen/ProductPage.dart';
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Gsh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor("#3D3CB3"),
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: TextStyle(
            fontSize: 20,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.normal,
          )
        )),


    home: DashboardPage());
  }

}