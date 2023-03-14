import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/resgisterationScreen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  var displayNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String imageUrl = '';
  File? image;
  Future pickImageFromDevice() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null) return;
    final tempImage = File(xFile.path);
    setState(() {
      image = tempImage;
      print(image!.path);
    });

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference refrenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await refrenceImageToUpload.putFile(File(xFile.path));

      imageUrl = await refrenceImageToUpload.getDownloadURL();
    } catch (error) {}
    print(imageUrl);
  }

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
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 30),
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Color.fromARGB(255, 254, 230, 159),
                            backgroundImage:
                                image == null ? null : FileImage(image!),
                          )),
                      Positioned(
                          top: 120,
                          left: 120,
                          child: SizedBox(
                            width: 50,
                            child: RawMaterialButton(
                                // constraints: BoxConstraints.tight(const Size(45, 45)),
                                elevation: 10,
                                fillColor: Colors.amber,
                                child: const Align(
                                    // ignore: unnecessary_const
                                    child: Icon(Icons.add_a_photo,
                                        color: Colors.white, size: 22)),
                                padding: const EdgeInsets.all(15),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Choose option',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.amber)),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      pickImageFromDevice();
                                                    },
                                                    splashColor:
                                                        HexColor('#FA8072'),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Icon(
                                                              Icons.image,
                                                              color:
                                                                  Colors.amber),
                                                        ),
                                                        Text('Gallery',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ))
                                                      ],
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      // pickImageFromCamera();
                                                    },
                                                    splashColor:
                                                        HexColor('#FA8072'),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Icon(
                                                              Icons.camera,
                                                              color:
                                                                  Colors.amber),
                                                        ),
                                                        Text('Camera',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ))
                                                      ],
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                    splashColor:
                                                        HexColor('#FA8072'),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Icon(
                                                              Icons
                                                                  .remove_circle,
                                                              color:
                                                                  Colors.amber),
                                                        ),
                                                        Text('Remove',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ))
                                                      ],
                                                    ))
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }),
                          )),
                    ],
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: Form(
                    key: _formKey,
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: TextFormField(
                              
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: TextFormField(
                            validator: (value) {
                                if (value!.length < 6) {
                                  return 'يجب ان لا تقل كلمة المرور عن 6 عناصر';
                                }
                                return null;
                              },
                              controller: passwordController,
                              obscureText: true,
                              style: TextStyle(
                                  fontFamily: "yel",
                                  color: Colors.amber.shade500),
                              // controller: addRoomProvider.bednocon,

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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                                                color:
                                                    Colors.amber.shade500)))),
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
                                      phoneNumber.isEmpty ||
                                      imageUrl.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: 'برجاء ملأ جميع الحقول');
                                    return;
                                  }
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                  }

                                  ProgressDialog progressDialog =
                                      ProgressDialog(context,
                                          title: Text('Signing Up'),
                                          message: Text('Please Wait'));
                                  progressDialog.show();

                                  try {
                                    FirebaseAuth auth = FirebaseAuth.instance;
                                    UserCredential userCredential = await auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);

                                    if (userCredential.user != null) {
                                      DatabaseReference userRef =
                                          FirebaseDatabase.instance
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
                                        'imageUrl': imageUrl,
                                        
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
