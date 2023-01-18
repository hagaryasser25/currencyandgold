import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/resgisterationScreen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var displayNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.black,
            child: ListView(
              children: [
                Container(
                  // color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    image: new DecorationImage(
                      image: new ExactAssetImage('assets/images/jojo.PNG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "انشاء الحساب",
                            style: TextStyle(
                                color: Colors.amber.shade500,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: TextField(
                            controller: displayNameController,
                            style: TextStyle(
                                fontFamily: "yel",
                                color: Colors.amber.shade500),
                            // controller: addRoomProvider.bednocon,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.amber.shade600),
                              ),

                              hintText: 'ادخل الاسم ',
                              hintStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              labelText: 'الاسم ',
                              labelStyle:
                                  TextStyle(color: Colors.amber.shade500),

                              //prefixText: ' ',
                              //suffixText: 'USD',
                              //suffixStyle: const TextStyle(color: Colors.green)),
                            )),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: TextField(
                            controller: phoneNumberController,
                            style: TextStyle(
                                fontFamily: "yel",
                                color: Colors.amber.shade500),
                            // controller: addRoomProvider.bednocon,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.amber.shade600),
                              ),

                              hintText: 'ادخل الهاتف',
                              hintStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              labelText: 'الهاتف',
                              labelStyle:
                                  TextStyle(color: Colors.amber.shade500),

                              //prefixText: ' ',
                              //suffixText: 'USD',
                              //suffixStyle: const TextStyle(color: Colors.green)),
                            )),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: TextField(
                            controller: emailController,
                            style: TextStyle(
                                fontFamily: "yel",
                                color: Colors.amber.shade500),
                            // controller: addRoomProvider.bednocon,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: new InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.amber.shade500),
                              ),

                              hintText: 'ادخل البريد الالكترونى ',
                              hintStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              labelText: 'كلمة البريد الالكترونى',
                              labelStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              counterStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              suffixStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              //prefixText: ' ',
                              //suffixText: 'USD',
                              //suffixStyle: const TextStyle(color: Colors.green)),
                            )),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: TextField(
                            controller: passwordController,
                            style: TextStyle(
                                fontFamily: "yel",
                                color: Colors.amber.shade500),
                            // controller: addRoomProvider.bednocon,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: new InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.amber.shade500),
                              ),

                              hintText: 'ادخل كلمة المرور',
                              hintStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              labelText: 'كلمة المرور',
                              labelStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              counterStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              suffixStyle:
                                  TextStyle(color: Colors.amber.shade500),
                              //prefixText: ' ',
                              //suffixText: 'USD',
                              //suffixStyle: const TextStyle(color: Colors.green)),
                            )),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Container(
                          width: 150,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.amber),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.amber.shade500)))),
                              child: Text(
                                "انشاء حساب",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () async {
                                var displayName =
                                    displayNameController.text.trim();
                                var phoneNumber =
                                    phoneNumberController.text.trim();
                                var email = emailController.text.trim();
                                var password = passwordController.text.trim();

                                if (displayName.isEmpty ||
                                    email.isEmpty ||
                                    password.isEmpty ||
                                    phoneNumber.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please fill all fields');
                                  return;
                                }

                                if (password.length < 6) {
                                  // show error toast
                                  Fluttertoast.showToast(
                                      msg:
                                          'Weak Password, at least 6 characters are required');

                                  return;
                                }

                                ProgressDialog progressDialog = ProgressDialog(
                                    context,
                                    title: Text('Signing Up'),
                                    message: Text('Please Wait'));
                                progressDialog.show();

                                try {
                                  FirebaseAuth auth = FirebaseAuth.instance;
                                  UserCredential userCredential =
                                      await auth.createUserWithEmailAndPassword(
                                          email: email, password: password);

                                  if (userCredential.user != null) {
                                    DatabaseReference userRef = FirebaseDatabase
                                        .instance
                                        .reference()
                                        .child('users');

                                    String uid = userCredential.user!.uid;
                                    int dt =
                                        DateTime.now().millisecondsSinceEpoch;

                                    await userRef.child(uid).set({
                                      'fullName': displayName,
                                      'email': email,
                                      'uid': uid,
                                      'dt': dt,
                                      'phoneNumber': phoneNumber,
                                    });

                                    Fluttertoast.showToast(msg: 'Success');

                                    Navigator.of(context).pop();
                                  } else {
                                    Fluttertoast.showToast(msg: 'Failed');
                                  }
                                  progressDialog.dismiss();
                                } on FirebaseAuthException catch (e) {
                                  progressDialog.dismiss();
                                  if (e.code == 'email-already-in-use') {
                                    Fluttertoast.showToast(
                                        msg: 'Email is already exist');
                                  } else if (e.code == 'weak-password') {
                                    Fluttertoast.showToast(
                                        msg: 'Password is weak');
                                  }
                                } catch (e) {
                                  progressDialog.dismiss();
                                  Fluttertoast.showToast(
                                      msg: 'Something went wrong');
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
