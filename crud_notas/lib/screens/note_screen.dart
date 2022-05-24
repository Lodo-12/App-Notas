import 'package:crud_notas/models/models.dart';
import 'package:crud_notas/models/notes.dart';
import 'package:flutter/material.dart';
import 'package:crud_notas/providers/note_form_provider.dart';
import 'package:provider/provider.dart';


// class NoteScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     final noteService = Provider.of<NotesService>(context);

//     return ChangeNotifierProvider(
//       create: ( _ ) => NoteFormProvider( noteService.selectedNote ),
//       child: _NoteBackScreen( noteService : noteService),
//     );
//   }
// }


class _NoteBackScreen extends StatelessWidget {


  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _descriptionController = new TextEditingController();
  final GlobalKey  _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   late String titleText;
   late String descriptionText;

   final noteForm = Provider.of<NoteFormProvider>(context);

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
         child: Form(
           key: _formularioKey,
           autovalidateMode: AutovalidateMode.onUserInteraction,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               TextFormField(
                 controller: _titleController,
                 decoration: InputDecoration(
                   border: InputBorder.none ,
                   hintText: 'New Title',
                   hintStyle: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)
                 ),
                 onChanged: (value) {
                   titleText = value;
                 },
               ),
                Expanded(
                  child: TextFormField(
                    controller: _descriptionController,
                   decoration: InputDecoration(
                     border: InputBorder.none ,
                     hintText: 'New Description',
                     hintStyle: TextStyle(fontSize: 18,
                      color: Colors.white),
                   ),
                   onChanged: (value){
                     descriptionText = value;
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
                onPressed: (){
                  if( _formularioKey.currentState!.validate(){

                  },
                }
                 )
                  ],
              ),
         )  
         ),
         
         );
  }
}