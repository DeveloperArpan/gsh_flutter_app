import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget myAppBar(){
  return AppBar(

    actions: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 5, right: 10, top: 5, bottom: 2),
            child: Text('Hi Rahul',
                style:TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 5, right: 5, top: 2, bottom: 2),
            child:  Text('Daily Schedule',
                style:TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),

        ],
      )

    ],
  );

}