import 'package:currencyandgold/screens/admin/admin_company.dart';
import 'package:currencyandgold/screens/admin/admin_currency.dart';
import 'package:currencyandgold/screens/admin/admin_gold.dart';
import 'package:currencyandgold/screens/user/openscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AdminHomePage extends StatefulWidget {
  static const routeName = '/adminHomeScreen';
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text("الصفحة الرئيسية", style: TextStyle(color: Colors.black))),
          backgroundColor: Colors.amber.shade500,
          actions: [],
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            children: [
              Image(
                image: AssetImage('assets/images/jojo.PNG'),
                width: double.infinity,
              ),
              Center(
                  child: Text(
                "الخدمات لمتاحة",
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
                        height: 120,
                        width: 120,
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
                              Navigator.pushNamed(
                                  context, AdminGoldPage.routeName);
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text(
                              "اضافة اسعار الذهب",
                            )),
                      ),
                    )),
                    Expanded(
                      child: SizedBox(
                        height: 120,
                        width: 120,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AdminCurrency()));
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text("اضافة اسعار العملات")),
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
                        height: 120,
                        width: 120,
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
                               Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AdminCompany()));
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text("اضافة اسعار اسهم البورصة")),
                      ),
                    )),
                    Expanded(
                      child: SizedBox(
                        height: 120,
                        width: 120,
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
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Confirmation!'),
                                      content: Text('Are you sure to logout?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.pushNamed(
                                                context, OpenScreen.routeName);
                                          },
                                          child: Text('Yes'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('No'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text("خروج")),
                      ),
                    ),
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
