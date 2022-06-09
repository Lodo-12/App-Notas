import 'package:flutter/material.dart';
import 'package:crud_notas/screens/screens.dart';
import 'package:crud_notas/services/auth_service.dart';
import 'package:provider/provider.dart';


class CheckAuthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final authservice = Provider.of<Authservice>( context, listen: false);

    return Scaffold(
      body: FutureBuilder(
        future: authservice.readToken(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

          if ( !snapshot.hasData )
            return Text('espere');

            if (snapshot.data == ''){

          Future.microtask(() {

            Navigator.pushReplacement(context, PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginScreen(),
              transitionDuration: Duration( seconds: 0)
              )
            );
          });

        } else {

           Future.microtask(() {

            Navigator.pushReplacement(context, PageRouteBuilder(
              pageBuilder: (_, __, ___) => HomeScreen(),
              transitionDuration: Duration( seconds: 0)
              )
            );


        });
      }
          return Container();
        },
      )
     );
  }
}