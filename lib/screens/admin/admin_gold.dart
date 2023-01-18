import 'package:currencyandgold/screens/admin/add_gold.dart';
import 'package:currencyandgold/screens/admin/adminGold_details.dart';
import 'package:currencyandgold/screens/admin/admin_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminGoldPage extends StatefulWidget {
  static const routeName = '/adminGoldScreen';
  const AdminGoldPage({Key? key}) : super(key: key);

  @override
  _AdminGoldPageState createState() => _AdminGoldPageState();
}

class _AdminGoldPageState extends State<AdminGoldPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.center,
              child: Text(
                "اسعار الذهب",
                style: TextStyle(color: Colors.black),
              )),
          backgroundColor: Colors.amber.shade500,
          automaticallyImplyLeading: false,
          actions: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AdminHomePage.routeName);
                  },
                  icon: Icon(Icons.arrow_forward, color: Colors.black,)),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber.shade500,
          onPressed: () {
            Navigator.pushNamed(context, AddGold.routeName);
          },
          child: Icon(Icons.add),
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
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        side: BorderSide(
                                            color: Colors.blue.shade900)))),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AdminGoldDetails(
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
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        side: BorderSide(
                                            color: Colors.blue.shade900)))),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AdminGoldDetails(
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
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        side: BorderSide(
                                            color: Colors.blue.shade900)))),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AdminGoldDetails(
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
