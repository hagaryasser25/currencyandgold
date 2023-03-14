import 'package:currencyandgold/screens/admin/add_company.dart';
import 'package:currencyandgold/screens/admin/add_currency.dart';
import 'package:currencyandgold/screens/admin/add_gold.dart';
import 'package:currencyandgold/screens/admin/admin_company.dart';
import 'package:currencyandgold/screens/admin/admin_currency.dart';
import 'package:currencyandgold/screens/admin/admin_gold.dart';
import 'package:currencyandgold/screens/admin/admin_home.dart';
import 'package:currencyandgold/screens/admin/admin_login.dart';
import 'package:currencyandgold/screens/admin/users_app.dart';
import 'package:currencyandgold/screens/auth/login.dart';
import 'package:currencyandgold/screens/user/homepage.dart';
import 'package:currencyandgold/screens/user/openscreen.dart';
import 'package:currencyandgold/screens/auth/reg.dart';
import 'package:currencyandgold/screens/user/userGold_details.dart';
import 'package:currencyandgold/screens/user/user_company.dart';
import 'package:currencyandgold/screens/user/user_currency.dart';
import 'package:currencyandgold/screens/user/user_gold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: FirebaseAuth.instance.currentUser == null
        ?
        const OpenScreen()
        :
        FirebaseAuth.instance.currentUser?.email == 'admin@gmail.com'
        ?
        const AdminHomePage()
        :
        const CustomerHomePage()
        ,
         
        routes: {
          RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          CustomerHomePage.routeName: (ctx) => CustomerHomePage(),
          AdminLogin.routeName: (ctx) => AdminLogin(),
          AdminHomePage.routeName: (ctx) => AdminHomePage(),
          AddGold.routeName: (ctx) => AddGold(),
          AdminGoldPage.routeName: (ctx) => AdminGoldPage(),
          OpenScreen.routeName: (ctx) => OpenScreen(),
          UserGoldPage.routeName: (ctx) => UserGoldPage(),
          AddCurrency.routeName: (ctx) => AddCurrency(),
          AdminCurrency.routeName: (ctx) => AdminCurrency(),
          UserCurrency.routeName: (ctx) => UserCurrency(),
          AddCompany.routeName: (ctx) => AddCompany(),
          AdminCompany.routeName: (ctx) => AdminCompany(),
          UserCompany.routeName: (ctx) => UserCompany(),
          UsersApp.routeName: (ctx) => UsersApp(),
        });
  }
}
