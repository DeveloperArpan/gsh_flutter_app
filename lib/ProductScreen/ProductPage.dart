import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gsh/HomeScreen/DashboardPage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../NetworkServices/ServiceUrl.dart';
class ProductPage  extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool visibilityTag = false;
  bool visibilityTagclick = false;
  bool visibilitynoresponse = false;
  TextEditingController searchingController = TextEditingController();
  int pageIndex = 0;
  int ITEMIID=0;
  var size,height,width;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];
  List categorylist = [];
  List Productlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   this.ProductApi();
    this.CategoryApi();
  }
  CategoryApi() {
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
   //   print(data);
   //   print(message);
      print(rest);

      if (response.statusCode == 200) {
        // if (success == true) {
        setState(() {
          categorylist = json.decode(response.body)['data'];


         // print('categorylist==>'+categorylist.toString());
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
    Productlist=[];
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
     // print(data);
     // print(message);
      print(rest);

      if (response.statusCode == 200) {
        var data1 =json.decode(response.body)['count'];
        if(data1==0){
          print('if body');
          Productlist=[];
          visibilitynoresponse=true;
        }else{

          print('else body');
          visibilitynoresponse=false;
          visibilityTag=true;
          visibilityTagclick=false;
          Productlist = json.decode(response.body)['data'];
          searchingController.clear();
        }


              setState(() {

        });
      } else if (response.statusCode == 401) {
        var data = json.decode(response.body);
        var message = data["message"];
        var errors1 = data["message"] as List;

      }
    });
  }
  ProductIdWiseShowApi(var id) {
    Productlist=[];
    //searchingController.clear();
    setState(() {
      //  isLoading = true;
    });
    http.get(
      Uri.parse(ServiceUrl().BASE_URL+ServiceUrl().ProductIdWiseSort+id),
      headers: {
        'Accept': 'application/json',
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SjFjMlZ5U1dRaU9pSXlaVGN3WVRrNU9TMDRaakZqTFRSaU5ETXRZak0wTVMwNVlqVTRPV1ZpTUdNMU5tTWlMQ0pwWVhRaU9qRTJOalExTWpBMk16VXNJbVY0Y0NJNk1UY3lOelU1TWpZek5YMC5nZVlwNnlKd3RSU2FuellSUmNFR056bThVd3NfTHZoOVhBN1dJcjc4Tnkw'
      },
    ).then((response) async {
      var data1 = json.decode(response.body);
      var message = data1["message"];
      var success = data1["success"];
      var rest = data1["errors"] ;
      if (response.statusCode == 200) {


       var data1 =json.decode(response.body)['count'];

        if(data1==0){
          print('if body');
          visibilitynoresponse=true;
        }else{
          print('else body');
          visibilitynoresponse=false;
          visibilityTag=false;
          visibilityTagclick=true;
          Productlist= json.decode(response.body)['data'];
        }



        // if (success == true) {


        setState(() {

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
  ProductSearchingApi(var searchtext) {
    Productlist=[];
    ITEMIID=0;
    setState(() {
      //  isLoading = true;
    });
    http.get(
      Uri.parse(ServiceUrl().BASE_URL+ServiceUrl().Productsearching+searchtext),
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
      // print(data);
      // print(message);
      print(rest);

      if (response.statusCode == 200) {
        // if (success == true) {
        var varresponse=json.decode(response.body)['data'];
        var data1 =json.decode(response.body)['count'];
       // print('searching==>'+varresponse.toString());

        if(data1==0){
          print('if body');
          Productlist=[];
          visibilitynoresponse=true;
        }else{

          print('else body');
          visibilitynoresponse=false;
          visibilityTag=true;
          visibilityTagclick=false;
          Productlist = json.decode(response.body)['data'];
          searchingController.clear();
        }


        setState(() {

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
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) => DashboardPage()));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) =>  DashboardPage()),
              // );
            }, // Image tapped
            child: Center(
              child: Image.asset(
                'assets/images/icons/back_arrow.png', // Fixes border issues
                width: 40.0,
                height: 40.0,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: Center(
                  child: Text("All Products",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color:HexColor("#3D3CB3"),
                      )
                  ),
                ),
              ),
            )
          ],
        ),
        body: Container(
            child: SingleChildScrollView(
            child: Column(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Card(
                        color: HexColor('#C4C4C4'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                        children: <Widget>[
                            Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/images/icons/icon-searching.png',
                                    width: 40,
                                    height: 40, ),
                              ),
                            ),

                          // TextField(
                          //   decoration: InputDecoration(
                          //     hintText: '',
                          //   ),
                          // ),
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0,bottom: 5,left: 0,right: 0),
                              child: TextField (
                                textInputAction: TextInputAction.search,
                                controller: searchingController,
                                onSubmitted: (value) {
                                  print("search==>>"+value);
                                  print("search==>>"+searchingController.toString());
                                  ProductSearchingApi(value);

                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(fontSize: 14.0, color: Colors.black),
                                    hintText: 'Find your favorites here'

                                ),
                              ),
                            ),
                          ),
                        )

                        ]) ,
                      )

                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Column(children: <Widget>[
                        Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 //
                                 // Row(
                                 //   children:<Widget> [
                                 //     Container(
                                 //         width:width*.10,
                                 //        child: Text(
                                 //           'All',
                                 //           style: const TextStyle(color: Colors.black, fontSize: 10),
                                 //         )
                                 //     ),
                                 //
                                 //   ],
                                 // ),
                                Container(
                                  width:width*.80,
                                  height: height*.1,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categorylist.length,

                                    itemBuilder: (BuildContext ctx, index) {
                                      if(ITEMIID==categorylist[index]["id"]){
                                        return Container(
                                            alignment: Alignment.center,
                                            child: Card(
                                                elevation: 4,
                                                color:HexColor('#3E3DB4'),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child:GestureDetector(
                                                  onTap: () {
                                                    var ID=categorylist[index]["id"].toString();
                                                    print('Click Item===>>'+ID);
                                                    ProductIdWiseShowApi(ID);
                                                    ITEMIID=categorylist[index]["id"];
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      Center(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: SizedBox(
                                                            width: 60,
                                                            height: 40,
                                                            child: Center(
                                                              child: Text(
                                                                categorylist[index]["name"],
                                                                style:  TextStyle(color: Colors.white, fontSize: 10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ) ,
                                                )
                                            )

                                        );
                                      }else{
                                        return Container(
                                            alignment: Alignment.center,
                                            child: Card(
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child:GestureDetector(
                                                  onTap: () {
                                                    ITEMIID=categorylist[index]["id"];
                                                    var ID=categorylist[index]["id"].toString();
                                                    print('Click Item===>>'+ID);
                                                    ProductIdWiseShowApi(ID);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      Center(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: SizedBox(
                                                            width: 60,
                                                            height: 40,
                                                            child: Center(
                                                              child: Text(
                                                                categorylist[index]["name"],
                                                                style: TextStyle(color:HexColor('#3E3DB4'), fontSize: 10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ) ,
                                                )
                                            )

                                        );
                                      }

                                    },
                                  ),
                                )
                              ],

                            )
                        )
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,right: 0,left: 0,bottom: 0),
                        child: Column(children: <Widget>[
                          Visibility(
                              visible: visibilityTag,
                              child: getBody()),
                          Visibility(
                              visible: visibilityTagclick,
                              child: getBodyClick())
                        ]),
                      )
                    ],
                  ),

                 Column(
                   children: <Widget>[
                     Visibility(
                         visible: visibilitynoresponse,
                         child:Column(
                           children: <Widget>[
                             Image.asset(
                               'assets/images/icons/noplan.png',
                               height: 200,
                               width: 200,
                             ),
                             Text('No data Found', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16.0,color: Colors.black)),
                           ],
                         )
                     )

                   ],
                 )


                ]))),
        bottomNavigationBar: buildMyNavBar(context),

    );

  }
    getBody() {

     return GridView.builder(
      shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount:  Productlist.length,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
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
                                    width: 70.0,
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
        });


  }
   getBodyClick() {

       return GridView.builder(
           shrinkWrap: true,
           physics: ScrollPhysics(),
           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 200,
               childAspectRatio: 3 / 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10),
           itemCount:  Productlist.length,
           itemBuilder: (BuildContext ctx, index) {
             return Padding(
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
                                     child: Image.network(Productlist[index]["category_product"][0]["product_images"][0]["url"],
                                         width: 60.0,
                                         height: 40.0,
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
                                           child:Text(Productlist[index]["category_product"][0]["name"],
                                               style: TextStyle(
                                                 fontSize: 10.0,
                                                 fontWeight: FontWeight.normal,
                                                 color:HexColor("#000000"),
                                               )),
                                         ),
                                         Align(
                                             alignment: Alignment.centerLeft,
                                             child:  Text("Rs."+Productlist[index]["category_product"][0]["max_retail_price"],
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
           });

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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => DashboardPage()));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  DashboardPage()),
                // );
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => ProductPage()));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  ProductPage()),
                // );
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