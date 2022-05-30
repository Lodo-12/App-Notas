import 'package:flutter/material.dart';
import 'package:crud_notas/models/models.dart';


class NoteCard extends StatelessWidget {
 
 final Notes notes;

  const NoteCard({
    super.key,
    required this.notes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _NotesDetails(
             title: notes.title,
             description: notes.description,
             )
          ]
        ),
      )
    );
  }
}

class _NotesDetails extends StatelessWidget {
   final String title;
   final String description;

  
  const _NotesDetails({super.key,
   required this.title,
    required this.description,});


    @override
    Widget build(BuildContext context) {
      return Padding(
          padding: EdgeInsets.all(15),
          child:  Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Form(
              child: Column(
                children:[
              TextFormField(
                     decoration: InputDecoration(
                       border: InputBorder.none ,
                       hintText: 'New Title',
                       hintStyle: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                     ),
                     validator: (String? dato){
                       if(dato!.isEmpty){
                         return 'No has puesto nada';
                       }
                     },
                   ),
                    Expanded(
                      child: TextFormField(
                       decoration: InputDecoration(
                         border: InputBorder.none ,
                         hintText: 'New Description',
                         hintStyle: TextStyle(fontSize: 18,
                          color: Colors.white),
                       ),
                       validator: (String? dato){
                       if(dato!.isEmpty){
                         return 'No has puesto nada';
                       }
                     },
                      )      
                    ),
                  // ignore: deprecated_member_use
                  FlatButton(
                   child: 
                      // ? CircularProgressIndicator( color: Colors.white,)
                       Text('Add note', style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)
                     ),
                    onPressed: ()async{
            
                      
                    }
                     ) ]
                  ),
            ),
          )
        );
    }
  }