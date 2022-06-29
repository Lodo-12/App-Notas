import 'package:crud_notas/models/models.dart';
import 'package:crud_notas/services/note_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

 class LoadingScreen extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

 class _LoadingState extends State<LoadingScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

   @override
     

  void initState() {
    _controller = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 177, 141, 74),
      appBar: AppBar(
        title: Text('Notas'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Lottie.asset('assets/loading.json',
        width: 150,
        height: 150,
        controller: _controller,
        onLoaded: (composition){
      
            _controller.duration = composition.duration;
            _controller.forward().whenComplete(() {
              Navigator.pushNamed(context, 'home');
             
            });

        },
       ),
     )
   );

  }
}