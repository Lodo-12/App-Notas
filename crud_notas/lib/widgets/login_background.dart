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
          // _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

// class _HeaderIcon extends StatelessWidget {
//   const _HeaderIcon({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         width: double.infinity,
//         margin: EdgeInsetsDirectional.only(top: 30),
//         child: Icon(Icons.person_pin, color: Colors.white, size: 100),
//       ),
//     );
//   }
// }

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
          Positioned(child: Icon(Icons.broken_image_outlined, color: Colors.white, size: 40), top: 75, left: 50),
          Positioned(child: Icon(Icons.image_aspect_ratio_rounded, color: Colors.white, size: 40), top: 130, left: 190),
          Positioned(child:Icon(Icons.bookmark_border, color: Colors.white, size: 40), top: 50, right: 110),
          Positioned(child: Icon(Icons.contact_page_outlined, color: Colors.white, size: 40), top: 160, right: 30),
          Positioned(child: Icon(Icons.photo_camera_back_outlined, color: Colors.white, size: 40,), top: 200, left: 120),
          Positioned(child: Icon(Icons.bookmark_border, color: Colors.white, size: 40), bottom: 33, left: 60),
          Positioned(child: Icon(Icons.photo_size_select_actual_outlined, color: Colors.white, size: 40,), top: 190, left: 5),

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