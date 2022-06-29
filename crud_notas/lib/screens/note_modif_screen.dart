import 'package:flutter/material.dart';
import 'package:crud_notas/services/note_service.dart';
import 'package:crud_notas/ui/input_decorations.dart';
import 'package:flutter/cupertino.dart';
import 'package:crud_notas/providers/note_form_provider.dart';
import 'package:provider/provider.dart';


class NoteModifScreen extends StatelessWidget {

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
      backgroundColor: Color.fromARGB(255, 177, 141, 74),
      appBar: AppBar(
        title: Text('Nota', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [ SizedBox(
          height: 10,
          width: 50,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 15),
            itemCount: 1,
               itemBuilder: (BuildContext context, int index)=>GestureDetector(
                 onTap: () {
                  showDialog(
              context: context,
               builder: (context) => AlertDialog(
                title: Text('¿Quieres borrar la nota?'),
                actions: [
                  TextButton(
                   child: Text('CANCEL'),
                   onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                   child: Text('OK'),
                   onPressed: () {
                  noteService.deleteNote(noteService.notes[index]);
                  Navigator.pushNamed(context, 'loading');
                   } ,
                  )                     
                ],
               )
               );

                 }, 
                child: Icon(
                CupertinoIcons.trash,
                 color: Colors.red,
                ),
            ),
              ),
        ),
        
        ]
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
                    return 'No has puesto nada';
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
                    return 'No has puesto nada';
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Descripcion',
                    labelText: 'Descripcion:'
                    ),
                ),

                
              //  NoteCard(notes: null,),
                TextButton(
                   child: 
                      // ? CircularProgressIndicator( color: Colors.white,)
                       Text('save note', style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255))
                     ),
                    onPressed: ()async{
                    
                    if( !notesForm.isValidForm()) return;

                    await noteService.saveOrCreateNote(notesForm.note);
                      
                      Navigator.pushNamed(context, 'loading');
                    }
                     )

                  ],
              ),
         )  
         ),
         
         );
  }
   
}

// class _DeleteButton extends StatelessWidget {


//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {

//            onPressed: () {
//             // noteService.deleteNote(noteService.notes[]);
//             Navigator.pop(context);
//            };
//       }
//     ),
//       child:IconButton(
//            color: Colors.red,
//            icon: Icon(CupertinoIcons.trash),
//     );
//   }
// }

// class _DeleteButton extends StatelessWidget {


//   @override
//   Widget build(BuildContext context) {

//   final noteService = Provider.of<NotesService>(context);
//    final notesForm = Provider.of<NoteFormProvider>(context);
//     final note = notesForm.note;

//     return  ListView.builder(
//             itemCount: noteService.notes.length,
//              itemBuilder: (BuildContext context, int index)=>GestureDetector(
//                onTap: () {
//               IconButton(
//                color: Colors.red,
//                icon: Icon(CupertinoIcons.trash),
//                onPressed: () {
//                 noteService.deleteNote(noteService.notes[index]);
//                 Navigator.pop(context);
//                }
//               );
//             },
//           ),
//       );
// }
// }