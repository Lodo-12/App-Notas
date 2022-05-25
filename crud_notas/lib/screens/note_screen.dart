import 'package:crud_notas/services/note_service.dart';
import 'package:crud_notas/ui/input_decorations.dart';
import 'package:crud_notas/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crud_notas/models/models.dart';
import 'package:crud_notas/models/notes.dart';
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

  const _NoteBackScreen({super.key,
   required this.noteService});

  final NotesService noteService;

  @override
  Widget build(BuildContext context) {

    final notesForm = Provider.of<NoteFormProvider>(context);
    final note = notesForm.note;

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
           key: notesForm.formKey,
           autovalidateMode: AutovalidateMode.onUserInteraction,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [

              SizedBox(height: 10),

                TextFormField(
                  initialValue: note.title,
                  onChanged: (value)=> note.title = value,
                  validator: (value) {
                    if( value == null || value.length < 1)
                    return 'El titulo es obligatorio';
                  },
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
                    return 'La descripcion es obligatoria';
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Descripcion',
                    labelText: 'Descripcion:'
                    ),
                )
              //  NoteCard(notes: null,),


                  ],
              ),
         )  
         ),
         
         );
  }
  
}
  
  

