import 'package:currencyandgold/screens/admin/admin_company.dart';
import 'package:currencyandgold/screens/admin/admin_gold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/company_model.dart';

class AddCompany extends StatefulWidget {
  static const routeName = '/addCompany';
  const AddCompany({Key? key}) : super(key: key);

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  var priceController = TextEditingController();
  var categoryController = TextEditingController();
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<Company> companyList = [];
  List<String> keyslist = [];
  String dropdownValue = 'أبو ظبي الإسلامي';

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
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            'اضافة سعر اسهم الشركات',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.amber.shade500,
        ),
        body: Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 20),
            child: Column(children: [
                     Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.black,
                ),
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Colors.amber.shade500),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: SizedBox(),

                    // Step 3.
                    value: dropdownValue,
                    icon: Padding(
                      padding: EdgeInsets.only(
                        right: 5
                      ),
                      child: Icon(Icons.arrow_drop_down,
                          color: Colors.amber.shade500),
                    ),

                    // Step 4.
                    items: keyslist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        
                        child: Center(
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 21, color: Colors.amber.shade500),
                          ),
                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: priceController,
                  style: TextStyle(
                      fontFamily: "yel", color: Colors.amber.shade500),
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.amber.shade600),
                    ),
                    hintText: "سعر السهم",
                    hintStyle: TextStyle(color: Colors.amber.shade500),
                    labelStyle: TextStyle(color: Colors.amber.shade500),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                  ),
                  onPressed: () async {
                    String companyPrice = priceController.text.trim();
                    String category = dropdownValue;

                    if (category.isEmpty) {
                      Fluttertoast.showToast(msg: 'Please provide goldcarat');
                      return;
                    }

                    if (companyPrice.isEmpty) {
                      Fluttertoast.showToast(msg: 'Please provide gold price');
                      return;
                    }

                    User? user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      String uid = user.uid;
                      int date = DateTime.now().millisecondsSinceEpoch;

                      DatabaseReference companyRef = FirebaseDatabase.instance
                          .reference()
                          .child('company')
                          .child('$category');

                      String? id = companyRef.push().key;

                      await companyRef.child(id!).set({
                        'date': date,
                        'companyPrice': companyPrice,
                        'id': id,
                      });
                    }
                    showAlertDialog(context);
                  },
                  child: Text('حفظ'))
            ]),
          ),
        )
        );
  }
}

void showAlertDialog(BuildContext context) {
  Widget remindButton = TextButton(
    style: TextButton.styleFrom(
      primary: Colors.amber.shade500,
    ),
    child: Text("Ok"),
    onPressed: () {
      Navigator.pushNamed(context, AdminCompany.routeName);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notice"),
    content: Text("your company's share price is created"),
    actions: [
      remindButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
