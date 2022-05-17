import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {

  final Widget child;

  const LoginCard({
    Key? key,
     required this.child
     }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: _createCardshape(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardshape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
          ]);
}
