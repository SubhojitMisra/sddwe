import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:payment_and_cart/Cart/cart_page.dart';
import 'package:payment_and_cart/authentication/auth.dart';
//import 'package:payment_and_cart/authentication/auth.dart';
//import 'package:payment_and_cart/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Authentication(),
    );
  }
}
