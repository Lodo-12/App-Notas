import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  
  final Widget child;

  const LoginBackground({
    Key? key,
     required this.child
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BlackBox(),
          this.child,
        ],
      ),
    );
  }
}

class _BlackBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(child: Icon(CupertinoIcons.book_circle, color: Colors.white, size: 40), top: 75, left: 50),
          Positioned(child: Icon(CupertinoIcons.calendar_badge_minus, color: Colors.white, size: 40), top: 130, left: 190),
          Positioned(child:Icon(Icons.bookmark_border, color: Colors.white, size: 40), top: 50, right: 110),
          Positioned(child: Icon(CupertinoIcons.personalhotspot, color: Colors.white, size: 40), top: 100, right: 50),
          Positioned(child: Icon(CupertinoIcons.alarm, color: Colors.white, size: 40), top: 200, right: 30),
          Positioned(child: Icon(CupertinoIcons.photo_camera, color: Colors.white, size: 40,), top: 200, left: 120),
          Positioned(child: Icon(Icons.bookmark_border, color: Colors.white, size: 40), bottom: 33, left: 60),
          Positioned(child: Icon(CupertinoIcons.photo_on_rectangle, color: Colors.white, size: 40,), top: 190, left: 5),

        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(70), bottomLeft: Radius.circular(40)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 10, 10, 11),
          Color.fromARGB(255, 43, 43, 44)
        ]),
      );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     
    );
  }
}