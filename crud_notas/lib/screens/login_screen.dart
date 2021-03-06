import 'package:flutter/material.dart';
import 'package:crud_notas/services/auth_service.dart';
import 'package:crud_notas/widgets/login_background.dart';
import 'package:crud_notas/widgets/login_card.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';
import '../services/notifications_services.dart';
import '../ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    body: LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            LoginCard(
                child: Column(
              children: [
                SizedBox(height: 10),
                Text('Login', style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(), child: _LoginForm())
              ],
            )
        ),
        SizedBox(height: 50),
          TextButton(
           onPressed: () => Navigator.popAndPushNamed(context, 'register'),
           style: ButtonStyle(
             overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
             shape: MaterialStateProperty.all( StadiumBorder())
           ),
           child: Text(
            'Crear una nueva cuenta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
           ),
          ),
          SizedBox(height: 50),
          ]
         ),
      ),
  )
 );
 }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
        child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginForm.formKey,
      child: Column(children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
              hintText: 'ejemplo@gmail.com',
              labelText: 'Correo Electr??nico',
              prefixIcon: Icons.alternate_email_rounded),
          onChanged: (value) => loginForm.email = value,
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp = new RegExp(pattern);

            return regExp.hasMatch(value ?? '')
                ? null
                : 'El correo es incorrecto';
          },
        ),
        SizedBox(height: 30),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
            hintText: '********',
            labelText: 'Contrase??a',
            prefixIcon: Icons.lock_outline,
          ),
          onChanged: (value) => loginForm.password = value,

          validator: (value) {
            return (value != null && value.length >= 6)
                ? null
                : ' La contrase??a debe de ser de 6 caracteres';
          },
        ),
        SizedBox(height: 30),
        MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Color.fromARGB(255, 9, 9, 9),
            elevation: 0,
            color: Colors.black,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoading ? 'Espere' : 'Ingresar',
                style: TextStyle(color: Colors.white),
              ),
            ),
           onPressed: loginForm.isLoading ? null : () async {
                
                FocusScope.of(context).unfocus();
                final authService = Provider.of<Authservice>(context, listen: false);

                if( !loginForm.isValidForm() ) return;
                loginForm.isLoading = true;

                final String? errorMessage = await authService.login(loginForm.email, loginForm.password);            

                  if( errorMessage == null) {
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {

                    // print( errorMessage );
                    NotificationsServices.showSnackbar(errorMessage);
                    loginForm.isLoading = false;
                  
                  }
               }
            )
      ]),
    ));
  }
}