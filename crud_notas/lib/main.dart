import 'package:crud_notas/models/models.dart';
import 'package:crud_notas/screens/home_screen.dart';
import 'package:crud_notas/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:crud_notas/screens/login_screen.dart';
import 'package:crud_notas/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'screens/register_screen.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_)=>Authservice()),
       ChangeNotifierProvider(create: (_)=> NotesOperation())
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
     initialRoute: 'register',
     routes: {
       'login': (_) => LoginScreen(),
       'register': (_) => RegisterScreen(),
       'home': (_) => HomeScreen(),
       'note': (_) => NoteScreen(),
     },
    );
  }
}