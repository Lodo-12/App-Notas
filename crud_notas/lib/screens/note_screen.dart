import 'package:crud_notas/models/models.dart';
import 'package:crud_notas/models/notes.dart';
import 'package:flutter/material.dart';
import 'package:crud_notas/providers/note_form_provider.dart';
import 'package:crud_notas/services/notes_service.dart';
import 'package:provider/provider.dart';


class NoteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final noteService = Provider.of<NotesService>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => NoteFormProvider( noteService.selectedNote ),
      child: _NoteBackScreen( noteService : noteService),
    );
  }
}


class _NoteBackScreen extends StatelessWidget {


  final NotesService noteService;

  const _NoteBackScreen({
    super.key,
   required this.noteService});

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
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             TextField(
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
                child: TextField(
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
             child: noteService.isSaving
                ? CircularProgressIndicator( color: Colors.white,)
                : Text('Add note', style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)
               ),
              onPressed:  noteService.isSaving
        ? null
        : ()async{
         if( !noteForm.isValidForm()) return;

         await noteService.saveOrCreateNote(noteForm.note);
              },
               )
                ],
            )  
         ),
         
         );
  }
}