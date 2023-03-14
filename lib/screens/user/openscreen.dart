import 'dart:async';

import 'package:currencyandgold/screens/auth/reg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';

class OpenScreen extends StatefulWidget {
  static const routeName = '/openScreen';

  const OpenScreen({Key? key}) : super(key: key);

  @override
  _OpenScreenState createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  bool _isLoading = true;
  void initState() {
    // TODO: implement initState
    super.initState();
    // 1. Using Timer
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
// 2. Future.delayed
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                "assets/images/splash.jfif",
              ),
            ),
            if (_isLoading) ...[
              Column(
                children: [
                  Center(
                      child: Text(
                    "welcome",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Yel",
                    ),
                  )),
                  Center(
                      child: Text(
                    "اهلا وسهلا",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Yel",
                    ),
                  )),
                ],
              )
            ] else ...[
              const Text('')
            ],
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                width: 150,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)))),
                  child: Text(
                    "سجل دخول",
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.routeName);
                },
                child: Text(
                  "اذا كان ليس لديك حساب انشىء حساب",
                  style: TextStyle(color: Colors.grey),
                )),
          ],
        ),
      ),
    );
  }
}
