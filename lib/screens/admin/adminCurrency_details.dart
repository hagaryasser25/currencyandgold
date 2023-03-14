import 'package:currencyandgold/models/gold_model.dart';
import 'package:currencyandgold/screens/admin/admin_currency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import '../../models/Currancymodel.dart';

class AdminCurrencyDetails extends StatefulWidget {
  String category;
  AdminCurrencyDetails({required this.category});

  @override
  State<AdminCurrencyDetails> createState() => _AdminCurrencyDetailsState();
}

class _AdminCurrencyDetailsState extends State<AdminCurrencyDetails> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<Currency> currencyList = [];
  List<String> keyslist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchGold();
  }

  @override
  void fetchGold() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database.reference().child("currency").child("${widget.category}");
    base.onChildAdded.listen((event) {
      print(event.snapshot.value);
      Currency p = Currency.fromJson(event.snapshot.value);
      currencyList.add(p);
      print(currencyList.length);
      keyslist.add(event.snapshot.key.toString());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.center,
              child: Text("اسعار ${widget.category}",
                  style: TextStyle(color: Colors.black))),
          backgroundColor: Colors.amber.shade500,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AdminCurrency.routeName);
                },
                icon: Icon(Icons.arrow_forward,color: Colors.black)),
          ],
        ),
        body: Container(
          color: Colors.black,
          child: ListView.builder(
            itemCount: currencyList.length,
            itemBuilder: (BuildContext context, int index) {
              var date = currencyList[index].date;
              return InkWell(
                onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>saveastmara(CentersList[index])));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 10, left: 10, bottom: 10, top: 20),
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
                                image: AssetImage("assets/images/cur.jpg"),
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
                                  alignment: Alignment.topLeft,
                                  child: new Text(
                                    'اليوم : ${getDate(date!)}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: new Align(
                                  alignment: Alignment.topLeft,
                                  child: new Text(
                                    'السعر بالجنيه: ${currencyList[index].currencyPrice.toString()}   ',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 37,
                            right: 7,
                          ),
                          child: IconButton(
                              onPressed: () async {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            super.widget));
                                base
                                    .child(currencyList[index].id.toString())
                                    .remove();
                              },
                              icon: Icon(Icons.delete)),
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

  String getDate(int date) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);

    return DateFormat('MMM dd yyyy').format(dateTime);
  }
}
