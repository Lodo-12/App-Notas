import 'package:crud_notas/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notas App',
     initialRoute: 'login',
     routes: {
       'login': (_) => LoginScreen(),
     },
    );
  }
}