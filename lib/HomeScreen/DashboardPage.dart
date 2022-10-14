import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gsh/CategoryScreen/CategoryPage.dart';
import 'package:gsh/ProductScreen/ProductPage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import '../NetworkServices/ServiceUrl.dart';
import '../appbar.dart';
class DashboardPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _Dashboard();
  }
}
class _Dashboard extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  List Productlist = [];
  List categorylist = [];
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.ProductApi();
    this.fetchCatagoryApi();
  }
  fetchCatagoryApi() {
    setState(() {
      //  isLoading = true;
    });
    http.get(
      Uri.parse(ServiceUrl().BASE_URL+ServiceUrl().CategoryList),
      headers: {
        'Accept': 'application/json',
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SjFjMlZ5U1dRaU9pSXlaVGN3WVRrNU9TMDRaakZqTFRSaU5ETXRZak0wTVMwNVlqVTRPV1ZpTUdNMU5tTWlMQ0pwWVhRaU9qRTJOalExTWpBMk16VXNJbVY0Y0NJNk1UY3lOelU1TWpZek5YMC5nZVlwNnlKd3RSU2FuellSUmNFR056bThVd3NfTHZoOVhBN1dJcjc4Tnkw'
      },
    ).then((response) async {
      var data = json.decode(response.body);
      var message = data["message"];
      var success = data["success"];
      var rest = data["errors"] ;
      print(data);
      print(message);
      print(rest);

      if (response.statusCode == 200) {
        // if (success == true) {
        setState(() {
          categorylist = json.decode(response.body)['data'];
          print('categorylist==>'+categorylist.toString());
          //   users = items;
          //   isLoading = false;
          //   visibilityTagStatus2 = false;
        });
        // } else {
        //  // isLoading = false;
        //   setState(() {
        //     // users = [];
        //     // visibilityTagStatus2 = true;
        //     // Fluttertoast.showToast(
        //     //     msg: message.toString(),
        //     //     toastLength: Toast.LENGTH_SHORT,
        //     //     gravity: ToastGravity.CENTER,
        //     //     timeInSecForIosWeb: 1,
        //     //     textColor: Colors.black,
        //     //     fontSize: 16.0);
        //   });
        // }
      } else if (response.statusCode == 401) {
        var data = json.decode(response.body);
        var message = data["message"];
        var errors1 = data["message"] as List;

      }
    });
  }
  ProductApi() {
    setState(() {
      //  isLoading = true;
    });
    http.get(
      Uri.parse(ServiceUrl().BASE_URL+ServiceUrl().AllProducts),
      headers: {
        'Accept': 'application/json',
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SjFjMlZ5U1dRaU9pSXlaVGN3WVRrNU9TMDRaakZqTFRSaU5ETXRZak0wTVMwNVlqVTRPV1ZpTUdNMU5tTWlMQ0pwWVhRaU9qRTJOalExTWpBMk16VXNJbVY0Y0NJNk1UY3lOelU1TWpZek5YMC5nZVlwNnlKd3RSU2FuellSUmNFR056bThVd3NfTHZoOVhBN1dJcjc4Tnkw'
      },
    ).then((response) async {
      var data = json.decode(response.body);
      var message = data["message"];
      var success = data["success"];
      var rest = data["errors"] ;
      //   print(data);
      //   print(message);
      print(rest);

      if (response.statusCode == 200) {
        // if (success == true) {
        setState(() {
          Productlist = json.decode(response.body)['data'];


          print('categorylist==>'+Productlist.toString());
          //   users = items;
          //   isLoading = false;
          //   visibilityTagStatus2 = false;
        });
        // } else {
        //  // isLoading = false;
        //   setState(() {
        //     // users = [];
        //     // visibilityTagStatus2 = true;
        //     // Fluttertoast.showToast(
        //     //     msg: message.toString(),
        //     //     toastLength: Toast.LENGTH_SHORT,
        //     //     gravity: ToastGravity.CENTER,
        //     //     timeInSecForIosWeb: 1,
        //     //     textColor: Colors.black,
        //     //     fontSize: 16.0);
        //   });
        // }
      } else if (response.statusCode == 401) {
        var data = json.decode(response.body);
        var message = data["message"];
        var errors1 = data["message"] as List;

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: HexColor('#F6F6F6'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:Row(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget> [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _scaffoldKey.currentState?.openDrawer();
                            });
                          }, // Image tapped
                          child:
                          Image.asset(
                            'assets/images/icons/menu_ic.png',
                            width:40.0,
                            height: 40.0,// Fixes border issues

                          ),
                        ),

                      ],
                    ),

                  ],
                )
            ),
            Row(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget> [
                    InkWell(
                      onTap: () {
                        // setState(() {
                        //   _scaffoldKey.currentState?.openDrawer();
                        // });
                      }, // Image tapped
                      child:
                      Image.asset(
                        'assets/images/icons/bell_icon.png',
                        width:40.0,
                        height: 40.0,// Fixes border issues

                      ),
                    ),

                  ],
                ),

              ],
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child:  Column(
                      children:  <Widget>[
                         Text('Hi Rahul',
                          style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color:HexColor("#3D3CB3"),
                        )),
                        Text('Daily Schedule',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color:HexColor("#3D3CB3"))),

                      ],
                    )
                ),)
            ],
          )




        ],
      ),
       drawer: Drawer(
         backgroundColor:HexColor("#3D3CB3"),
         shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
             topRight: Radius.circular(20),

             bottomRight: Radius.circular(20)),
       ),
    child: ListView(
    padding: EdgeInsets.zero,
      children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0,left: 10.0,right: 10.0,top: 25.0),
            child: Container(
               child:Row(
                  children: [
                    Image.asset('assets/images/icons/profile.png',
                      width: 100,
                      height: 100, ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                         Column(
                         children:const <Widget>[
                           Text("Rahul Kohil",
                               style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14.0)),
                           Text("  +91 8934524922",
                               style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14.0)),
                         ],
                         ),
                          Row(
                            children: <Widget>[
                              Image.asset('assets/images/icons/coin.png',
                                width: 30,
                                height: 30, ),

                              Column(
                                children: <Widget>[
                                  Text("103 Coins",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14.0)),
                                  Text("Reward Coins",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10.0)),
                                ],
                              )
                            ],
                          )



                      ],
                    )
                  ],

                )
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0,left: 10.0,right: 10.0,top: 0.0),
          child: SizedBox(
            width: 40.0,
            child: Column(
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  color: HexColor("#191B8F"),
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/images/icons/Profile_ic.png',
            width: 30,
            height: 30, ),
          title: const Text('My Profile ',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 12.0)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Image.asset('assets/images/icons/d_calendar.png',
            width: 30,
            height: 30,),
          title: const Text('Calender',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 12.0)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Image.asset('assets/images/icons/d_weekly_planner.png',
            width: 30,
            height: 30,),
          title: const Text('Weekly Planer',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 12.0)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading:  Image.asset('assets/images/icons/d_category.png',
            width: 30,
            height: 30,),
          title: const Text('Category ',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 12.0)),
          onTap: () {
            _scaffoldKey.currentState?.closeDrawer();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  CategoryPage()),
            );
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => CategoryPage()),
            //     ModalRoute.withName("/Home"));
          },
        ),
        ListTile(

        ),
        ListTile(

        ),
        ListTile(
          leading: Image.asset('assets/images/icons/language_ic.png',
            width: 30,
            height: 30,),
          title: const Text('Change Language ',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 12.0)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Image.asset('assets/images/icons/Support_ic.png',
            width: 30,
            height: 30,),
          title: const Text('Help & support',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 12.0)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Image.asset('assets/images/icons/Speech_ic.png',
            width: 30,
            height: 30,),
          title: const Text('Connect with us',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 12.0)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0,left: 10.0,right: 10.0,top: 0.0),
          child: SizedBox(
            width: 50.0,
            child: Column(
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  color:Colors.white,
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading:  Image.asset('assets/images/icons/Logout_ic.png',
            width: 40,
            height: 40,),
          title: const Text('Logout',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14.0)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
    ),
      body: Container(
        child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Container(
                child:SizedBox(
                  height: 110.0,
                  child: Card(
                      color: HexColor("#3D3CB3"),
                      elevation: 8.0,
                      child :Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                children: [
                                  SizedBox(
                                    width: 52,
                                    height: 60,
                                    child: Card(
                                      color:HexColor('#14B661'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                      child: Center(
                                        child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[

                                                Text('20', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12.0,color: Colors.white)),
                                                Center(
                                                  child: Divider(
                                                    height: 5,
                                                    thickness: 2,
                                                    indent: 10,
                                                    endIndent: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),

                                                Text('Sun', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10.0,color: Colors.white)),]
                                          ),
                                      )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 52,
                                    height: 60,
                                    child: Card(
                                      color: HexColor('#3332A0'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('21', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12.0,color: Colors.white)),
                                              Center(
                                                child: Divider(
                                                  height: 5,
                                                  thickness: 2,
                                                  indent: 10,
                                                  endIndent: 10,
                                                  color: Colors.white,
                                                ),
                                              ),

                                              Text('Mon', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10.0,color: Colors.white)),]

                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 52,
                                    height: 60,
                                    child:  Card(
                                        color: HexColor('#3332A0'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('22', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12.0,color: Colors.white)),
                                              Center(
                                                child: Divider(
                                                  height: 5,
                                                  thickness: 2,
                                                  indent: 10,
                                                  endIndent: 10,
                                                  color: Colors.white,
                                                ),
                                              ),

                                              Text('Tue', style:TextStyle(fontWeight: FontWeight.w600,fontSize: 10.0,color: Colors.white)),]

                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 52,
                                    height: 60,
                                    child:  Card(
                                        color: HexColor('#3332A0'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('23', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12.0,color: Colors.white)),
                                              Center(
                                                child: Divider(
                                                  height: 5,
                                                  thickness: 2,
                                                  indent: 10,
                                                  endIndent: 10,
                                                  color: Colors.white,
                                                ),
                                              ),

                                              Text('Wed', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10.0,color: Colors.white)),]

                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 52,
                                    height: 60,
                                    child:  Card(
                                        color: HexColor('#3332A0'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('24', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12.0,color: Colors.white)),
                                              Center(
                                                child: Divider(
                                                  height: 5,
                                                  thickness: 2,
                                                  indent: 10,
                                                  endIndent: 10,
                                                  color: Colors.white,
                                                ),
                                              ),

                                              Text('Thu', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12.0,color: Colors.white)),]

                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 52,
                                    height: 60,
                                    child: Card(
                                        color: HexColor('#3332A0'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('25', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12.0,color: Colors.white)),
                                              Center(
                                                child: Divider(
                                                  height: 5,
                                                  thickness: 2,
                                                  indent: 10,
                                                  endIndent: 10,
                                                  color: Colors.white,
                                                ),
                                              ),

                                              Text('Fri', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10.0,color: Colors.white)),]

                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 52,
                                    height: 60,
                                    child:  Card(
                                        color: HexColor('#3332A0'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('26', style:TextStyle(fontWeight: FontWeight.w700,fontSize: 12.0,color: Colors.white)),
                                              Center(
                                                child: Divider(
                                                  height: 5,
                                                  thickness: 2,
                                                  indent: 10,
                                                  endIndent: 10,
                                                  color: Colors.white,
                                                ),
                                              ),

                                              Center(child: Text('Sat', style:TextStyle(fontWeight: FontWeight.w600,fontSize: 10.0,color: Colors.white))),]

                                        )
                                    ),
                                  )
                                ] ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                            color: HexColor('#9CD2FF'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0,left: 10,right: 10,top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Octobar',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 12.0),
                                ),
                                Text(
                                  'Last order Delivery:Today 20-08-2022',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 10.0),
                                )


                              ],

                            ),
                          )
                        ],
                      ),
            ),
                )
            )]),
          // Container(
          //   alignment: Alignment.center,
          //   child:Center(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       mainAxisSize: MainAxisSize.max,
          //       children: <Widget>[
          //        Row(
          //          children: <Widget>[
          //            Text("-",
          //                style: TextStyle(
          //                  fontSize: 40.0,
          //                  fontWeight: FontWeight.bold,
          //                  color:HexColor("#14B661"),
          //                )),
          //            Text("Delivery",
          //                style: TextStyle(
          //                  fontSize: 14.0,
          //                  fontWeight: FontWeight.bold,
          //                  color:HexColor("#696969"),
          //                )
          //            ),
          //          ],
          //        ),
          //        Row(
          //          children: <Widget>[
          //            Text("-",
          //                style: TextStyle(
          //                  fontSize: 40.0,
          //                  fontWeight: FontWeight.bold,
          //                  color:HexColor("#FF7E70"),
          //                )),
          //            Text("Cancel",
          //                style: TextStyle(
          //                  fontSize: 14.0,
          //                  fontWeight: FontWeight.bold,
          //                  color:HexColor("#696969"),
          //                )
          //            ),
          //          ],
          //        ),
          //        Row(
          //          children: <Widget>[
          //            Text("-",
          //                style: TextStyle(
          //                  fontSize: 40.0,
          //                  fontWeight: FontWeight.bold,
          //                  color:HexColor("#457DD2"),
          //                )),
          //            Text("Upcoming",
          //                style: TextStyle(
          //                  fontSize: 14.0,
          //                  fontWeight: FontWeight.bold,
          //                  color:HexColor("#696969"),
          //                )
          //            ),
          //          ],
          //        ),
          //         Row(
          //           children: <Widget>[
          //             Column(
          //               children: <Widget>[
          //                 Divider(
          //                   color: Colors.black,
          //                 )
          //               ],
          //             ),
          //             Text("Onhold",
          //                 style: TextStyle(
          //                   fontSize: 14.0,
          //                   fontWeight: FontWeight.bold,
          //                   color:HexColor("#696969"),
          //                 )
          //             ),
          //           ],
          //         )
          //
          //       ],
          //     ),
          //   )
          // ),
          Container(
            width: 800,
           child: Image.asset('assets/images/icons/banner.png',
            ),

          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text('Deliver features faster'),
                          // Text('Craft beautiful UIs'),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0,right: 20.0,left: 0,bottom: 0),
                            child: Text("Featured Products",
                                textAlign:TextAlign.right,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color:HexColor("#09051C"),
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0,right: 0.0,left: 0,bottom: 0),
                            child: Text("Top product for easy shopping",
                                textAlign:TextAlign.right,
                                style: TextStyle(
                                  fontSize: 11.0,
                                  color:HexColor("#09051C"),
                                )
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ProductPage()),
                          );
                        },
                        child:  Text("Show All",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color:HexColor("#09051C"),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Column(children: <Widget>[
                  SafeArea(
                    child: SizedBox(
                        width: double.infinity,
                        height: 120.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:Productlist.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return  Padding(
                                padding: const EdgeInsets.only(bottom: 0.0,left: 2.0,right: 0.0,top: 0.0),
                                child:Column(
                                  children:<Widget> [
                                    Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.white70, width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:Container(
                                          alignment: Alignment.center,
                                          child:Column(
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:CrossAxisAlignment.start,
                                                children: <Widget> [
                                                  Center(child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Image.network(Productlist[index]["product_images"][0]["url"],
                                                        width: 100.0,
                                                        height: 60.0,
                                                        fit:BoxFit.fill ),
                                                  )
                                                  ),

                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 0.0,left: 0.0,right: 0.0,top: 0.0),
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.centerLeft,
                                                          child:Text(Productlist[index]["name"],
                                                              style: TextStyle(
                                                                fontSize: 10.0,
                                                                fontWeight: FontWeight.normal,
                                                                color:HexColor("#000000"),
                                                              )),
                                                        ),
                                                        // Text(categorylist[index]["description"],
                                                        //     style: TextStyle(
                                                        //       fontSize: 12.0,
                                                        //       fontWeight: FontWeight.normal,
                                                        //       color:HexColor("#000000"),
                                                        //
                                                        //     )),
                                                        Align(
                                                            alignment: Alignment.centerLeft,
                                                            child:  Text("Rs."+Productlist[index]["max_retail_price"],
                                                                style: TextStyle(
                                                                  fontSize: 12.0,
                                                                  overflow: TextOverflow.clip,
                                                                  fontWeight: FontWeight.normal,
                                                                  color:HexColor("#000000"),
                                                                ))
                                                        )


                                                      ],

                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 0.0,left: 0.0,right: 5.0,top: 5.0),
                                                    child: Container(
                                                        alignment: Alignment.centerLeft,
                                                        child: Card(
                                                            color: HexColor('#14B661'),
                                                            elevation: 5,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(2.0),
                                                              child: Row(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  Align(
                                                                    alignment: Alignment.centerRight,
                                                                    child: Text('Add',
                                                                        style: TextStyle(fontSize: 12.0,
                                                                            color: Colors.white,
                                                                            overflow: TextOverflow.clip,
                                                                            fontWeight: FontWeight.normal)),
                                                                  ),
                                                                  Image.asset('assets/images/icons/add.png',
                                                                      width: 20,
                                                                      height: 20)
                                                                ],
                                                              ),
                                                            )
                                                        )
                                                    ),
                                                  )

                                                ],
                                              )
                                            ],
                                          )

                                      ),
                                    ),
                                  ],
                                )









                            );
                          },
                        )),



                  )

                ]),

              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0,right: 20.0,left: 0,bottom: 0),
                            child: Text("Shop By Category",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color:HexColor("#09051C"),
                                )
                            ),
                          ),
                          Center(
                            child: Text("Top product for easy shopping",
                                textAlign:TextAlign.right,
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color:HexColor("#09051C"),
                                )
                            ),
                          )
                        ],
                      ), GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  CategoryPage()),
                        );
                      },
                  child:  Text("Show All",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color:HexColor("#09051C"),
                      )
                  ),
                ),
                    ],
                  ),
                ),
                Column(children: <Widget>[
                  SafeArea(
                    child: SizedBox(
                        width: double.infinity,
                        height: 200.0,
                        child:GridView.builder(
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 150,
                                childAspectRatio: 5 / 4,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4
                            ),
                            itemCount:  categorylist.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Center(
                                  child: Card(
                                    elevation: 4,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white70, width: 1),
                                      borderRadius: BorderRadius.circular(2),),
                                    child:Container(
                                        alignment: Alignment.center,
                                        child:Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget> [
                                              Center(child: Image.network(categorylist[index]["image"],
                                                  width: 80,
                                                  height: 60,
                                                  fit:BoxFit.fitHeight )
                                              ),
                                              Center(child: Text(categorylist[index]["name"],
                                                style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w800),
                                              )),
                                            ],
                                          ),
                                        )


                                    ),
                                  )
                              );
                            }) ),



                  )

                ]),


              ],
            ),
          )

        ])
        )
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );


  }
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: HexColor("#3D3CB3"),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DashboardPage()),
                );
              });
            },
            icon: pageIndex == 0
                ? const ImageIcon(
              AssetImage('assets/images/icons/F_Home.png'),
              color: Colors.white,
              size: 35,
            )
                : const ImageIcon(
              AssetImage('assets/images/icons/F_Home.png'),
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;

              });
            },
            icon: pageIndex == 1
                ? const ImageIcon(
              AssetImage('assets/images/icons/F_Cart.png'),
              color: Colors.white,
              size: 35,
            )
                : const ImageIcon(
              AssetImage('assets/images/icons/F_Cart.png'),
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProductPage()),
                );
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => ProductPage()),
                //     ModalRoute.withName("/Home"));
              });
            },
            icon: pageIndex == 2
                ? const ImageIcon(
              AssetImage('assets/images/icons/F_Products.png'),
              color: Colors.white,
              size: 35,
            )
                : const ImageIcon(
              AssetImage('assets/images/icons/F_Products.png'),
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const ImageIcon(
              AssetImage('assets/images/icons/F_Bills.png'),
              color: Colors.white,
              size: 35,
            )
                : const ImageIcon(
              AssetImage('assets/images/icons/F_Bills.png'),
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }

}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

}
