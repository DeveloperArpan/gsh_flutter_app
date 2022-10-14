import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsh/HomeScreen/DashboardPage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;


import '../NetworkServices/ServiceUrl.dart';
import '../ProductScreen/ProductPage.dart';
class CategoryPage  extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  List categorylist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          leading:InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  DashboardPage()),
              );
            }, // Image tapped
            child: Center(
              child: Image.asset(
                'assets/images/icons/back_arrow.png',
              // Fixes border issues
                width: 40.0,
                height: 40.0,
              ),
            ),
          ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
              child: Text("Categories",
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
        body:getBody(),
      bottomNavigationBar: buildMyNavBar(context),

    );
  }
  Widget getBody() {
    print('item==>$categorylist');
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount:  categorylist.length,
        itemBuilder: (BuildContext ctx, index) {
          return Center(
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Container(
                    alignment: Alignment.center,
                    child:Column(
                      children: <Widget> [
                        Center(child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(categorylist[index]["image"],
                              width: 90,
                              height: 80,
                              fit:BoxFit.fitHeight ),
                        )
                        ),
                        Center(child: Text(categorylist[index]["name"],
                            style: TextStyle(fontFamily: 'Montserrat',color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14.0),
                            )),
                      ],
                    )


                ),
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