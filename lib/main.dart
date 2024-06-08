import 'package:flutter/material.dart';
import 'package:ambion_flutter_app/login_page.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Urbanist'),
    home:const LoginPage(),
  );
  }
}

void main() {
  runApp(MyApp());
}