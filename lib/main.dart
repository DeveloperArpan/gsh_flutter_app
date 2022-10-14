import 'package:flutter/material.dart';
import 'package:gsh/MyApp.dart';
void main() =>runApp(MaterialApp(
  title: 'Gsh',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    accentColor: Colors.blue,
  ),
  home: MyApp(),
));
