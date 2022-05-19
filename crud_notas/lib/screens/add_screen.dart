import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titleText;
    String descriptionText;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 24, 18),
      appBar: AppBar(
        title: Text('Notas'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
        body:
         Padding(padding: EdgeInsets.all(15),
         child: Column(
           children: [
             TextField(
               decoration: InputDecoration(
                 border: InputBorder.none ,
                 hintText: 'New Title',
                 hintStyle: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)
               ),
             ),
              Expanded(
                child: TextField(
                 decoration: InputDecoration(
                   border: InputBorder.none ,
                   hintText: 'New Description',
                   hintStyle: TextStyle(fontSize: 18,
                    color: Colors.white),
                  
                 ),
                )      
              )],
         ),
         
         ),
    );
  }
}