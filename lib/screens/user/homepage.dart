import 'package:currencyandgold/screens/user/user_company.dart';
import 'package:currencyandgold/screens/user/user_currency.dart';
import 'package:currencyandgold/screens/user/user_gold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import 'openscreen.dart';

class CustomerHomePage extends StatefulWidget {
  static const routeName = '/HomeScreen';
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  late Users currentUser;

  void didChangeDependencies() {
    getUserData();
    super.didChangeDependencies();
  }

  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database
        .reference()
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid);

    final snapshot = await base.get();
    setState(() {
      currentUser = Users.fromSnapshot(snapshot);
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
              child: Text("الصفحة الرئيسية",
                  style: TextStyle(color: Colors.black))),
          backgroundColor: Colors.amber.shade500,
          actions: [],
          iconTheme: IconThemeData(color: Colors.black)
        ),
        drawer: Drawer(
          child: FutureBuilder(
            future: getUserData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (currentUser == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.amber.shade500,
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/person.png'),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("معلومات المستخدم",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person,
                      ),
                      title: const Text('اسم المستخدم'),
                      subtitle: Text('${currentUser.fullName}'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.email,
                      ),
                      title: const Text('البريد الالكترونى'),
                      subtitle: Text('${currentUser.email}'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                      ),
                      title: const Text('رقم الهاتف'),
                      subtitle: Text('${currentUser.phoneNumber}'),
                    ),
                    Divider(
                      thickness: .08,
                      color: Colors.grey,
                    ),
                    Material(
                        color: Colors.transparent,
                        child: InkWell(
                            splashColor: Theme.of(context).splashColor,
                            child: ListTile(
                              onTap: () {
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
                              title: Text('تسجيل الخروج'),
                              leading: Icon(Icons.exit_to_app_rounded),
                            )))
                  ],
                );
              }
            },
          ),
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
                                  context, UserGoldPage.routeName);
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text(
                              "أسعار الذهب",
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
                                  builder: (context) => UserCurrency()));
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text("اسعار العملات")),
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
                                  builder: (context) => UserCompany()));
                            },
                            icon: Icon(Icons.ac_unit),
                            label: Text("البورصة")),
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
