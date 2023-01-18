import 'package:currencyandgold/models/company_model.dart';
import 'package:currencyandgold/screens/admin/add_company.dart';
import 'package:currencyandgold/screens/admin/add_currency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/Currancymodel.dart';
import '../../models/gold_model.dart';
import 'adminCompany_details.dart';
import 'adminCurrency_details.dart';
import 'admin_home.dart';

class AdminCompany extends StatefulWidget {
  static const routeName = '/adminCompany';
  const AdminCompany({Key? key}) : super(key: key);

  @override
  State<AdminCompany> createState() => _AdminCompanyState();
}

class _AdminCompanyState extends State<AdminCompany> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<Company> companyList = [];
  List<String> keyslist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchCompany();
  }

  @override
  void fetchCompany() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database.reference().child("company");
    base.onChildAdded.listen((event) {
      print(event.snapshot.value);
      Company p = Company.fromJson(event.snapshot.value);
      keyslist.add(event.snapshot.key.toString());
      print(keyslist);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.center,
              child: Text(
                "اسعار اسهم الشركات",
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
                  icon: Icon(Icons.arrow_forward,color: Colors.black)),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber.shade500,
          onPressed: () {
            Navigator.pushNamed(context, AddCompany.routeName);
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          color: Colors.black,
          child: ListView.builder(
            itemCount: keyslist.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AdminCompanyDetails(
                      category: '${keyslist[index].toString()}',
                    );
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/trade2.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            /* add child content here */
                          ),
                        ),
                        Column(
                          //  mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: new Align(
                                  alignment: Alignment.center,
                                  child: new Text(
                                    keyslist[index].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
