import 'package:crud_notas/models/models.dart';
import 'package:crud_notas/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:crud_notas/services/note_service.dart';
import 'package:crud_notas/ui/input_decorations.dart';
import 'package:crud_notas/providers/note_form_provider.dart';
import 'package:provider/provider.dart';


class NoteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final noteService = Provider.of<NotesService>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => NoteFormProvider( noteService.selectedNote!),
      child: _NoteBackScreen( noteService : noteService),
    );
  }
}


class _NoteBackScreen extends StatelessWidget {
  List<Notes> notes = [];
  
   _NoteBackScreen({super.key,
   required this.noteService});

  final NotesService noteService;
  
  @override
  Widget build(BuildContext context) {

    final notesService = Provider.of<NotesService>(context);
    final notesForm = Provider.of<NoteFormProvider>(context);
    final note = notesForm.note;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 177, 141, 74),
      appBar: AppBar(
        title: Text('Nota', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
    ),
        body:
         Padding(padding: EdgeInsets.all(15),
         child: Form(
           key: notesForm.formKey,
          //  autovalidateMode: AutovalidateMode.onUserInteraction,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [

              SizedBox(height: 10),

                TextFormField(
                  initialValue: note.title,
                  onChanged: (value)=> note.title = value,
                  validator: (value) {
                    if( value == null || value.length < 1)
                    return 'No has puesto nada';
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Titulo',
                    labelText: 'Titulo:'
                    ),
                ),

              SizedBox(height: 10),

                TextFormField(
                  initialValue: note.description,
                  onChanged: (value)=> note.description = value,
                  validator: (value) {
                    if( value == null || value.length < 1)
                    return 'No has puesto nada';
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Descripcion',
                    labelText: 'Descripcion:'
                    ),
                ),

                
                TextButton(
                   child: 
                      // ? CircularProgressIndicator( color: Colors.white,)
                       Text('save note', style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255))
                     ),
                    onPressed: () async {
                    
                    if( !notesForm.isValidForm()) return;

                    await noteService.saveOrCreateNote(notesForm.note);

                     Navigator.pushNamed(context, 'loading');
                      notes.clear();
                      notesService.refreshNotes();
                                      
                    }
                     )

                  ],
              ),
         )  
         ),
         
         );
  }
   
}