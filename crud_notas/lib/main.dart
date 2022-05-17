import 'package:crud_notas/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:crud_notas/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
 ChangeNotifierProvider(create: (_)=>Authservice()),
      ],
      child: MyApp(),
    );
  }
}

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