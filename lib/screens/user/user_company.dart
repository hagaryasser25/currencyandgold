import 'package:currencyandgold/models/company_model.dart';
import 'package:currencyandgold/screens/admin/add_company.dart';
import 'package:currencyandgold/screens/admin/add_currency.dart';
import 'package:currencyandgold/screens/user/userCompany_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/Currancymodel.dart';
import '../../models/gold_model.dart';

class UserCompany extends StatefulWidget {
  static const routeName = '/UserCompany';
  const UserCompany({Key? key}) : super(key: key);

  @override
  State<UserCompany> createState() => _UserCompanyState();
}

class _UserCompanyState extends State<UserCompany> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<Company> companyList = [];
  List<String> keyslist = [];
  List<String> searchList = [];

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
      searchList.add(event.snapshot.key.toString());
      print(keyslist);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("اسعار اسهم الشركات"),
          backgroundColor: Colors.amber.shade500,
          actions: [],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: TextField(
                  onChanged: (char) {
                    setState(() {
                      if (char.isEmpty) {
                        setState(() {
                          keyslist = searchList;
                        });
                      } else {
                        keyslist = [];
                        for (String model in searchList) {
                          if (model.startsWith(char)) {
                            keyslist.add(model);
                          }
                        }
                        setState(() {});
                      }
                    });
                  },
                  style: TextStyle(
                      fontFamily: "yel", color: Colors.amber.shade500),
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.amber.shade600),
                    ),
                    hintText: "ابحث بالأسم",
                    hintStyle: TextStyle(color: Colors.amber.shade500),
                    labelStyle: TextStyle(color: Colors.amber.shade500),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: keyslist.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UserCompanyDetails(
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
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/trade2.jpg"),
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
                                        child: FittedBox(
                                          child: new Text(
                                            keyslist[index].toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
