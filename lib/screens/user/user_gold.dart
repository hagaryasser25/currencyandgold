import 'package:currencyandgold/screens/admin/add_gold.dart';
import 'package:currencyandgold/screens/admin/adminGold_details.dart';
import 'package:currencyandgold/screens/user/userGold_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserGoldPage extends StatefulWidget {
  static const routeName = '/userGoldScreen';
  const UserGoldPage({Key? key}) : super(key: key);

  @override
  _UserGoldPageState createState() => _UserGoldPageState();
}

class _UserGoldPageState extends State<UserGoldPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("اسعار الذهب"),
          backgroundColor: Colors.amber.shade500,
          actions: [],
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            children: [
              Image(
                image: AssetImage('assets/images/gold.PNG'),
                width: double.infinity,
              ),
              Center(
                  child: Text(
                "اسعار الذهب",
                style: TextStyle(fontSize: 30, color: Colors.amber.shade500),
              )),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.amber.shade500),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            side: BorderSide(
                                                color: Colors.blue.shade900)))),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserGoldDetails(
                                  category: '18',
                                );
                              }));
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text("عيار 18")),
                      ),
                    )),
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.amber.shade500),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            side: BorderSide(
                                                color: Colors.blue.shade900)))),
                            onPressed: () {
                               Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserGoldDetails(
                                  category: '21',
                                );
                              }));
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text("عيار 21")),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.amber.shade500),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            side: BorderSide(
                                                color: Colors.blue.shade900)))),
                            onPressed: () {
                               Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserGoldDetails(
                                  category: '24',
                                );
                              }));
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text("عيار 24")),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
