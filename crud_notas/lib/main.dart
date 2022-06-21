import 'package:flutter/material.dart';
import 'package:crud_notas/services/note_service.dart';
import 'package:crud_notas/screens/screens.dart';
import 'package:crud_notas/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_)=>Authservice()),
       ChangeNotifierProvider(create: (_)=>NotesService()),
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
       'register': (_) => RegisterScreen(),
       'home': (_) => HomeScreen(),
       'note': (_) => NoteScreen(),
       'edit': (_) => NoteModifScreen(),
       'checking' : (_) => CheckAuthScreen(),
     },
    );
  }
}