import 'package:flutter/material.dart';
import 'package:crud_notas/models/notes.dart';

class NoteFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Notes note;

  NoteFormProvider( this.note );

  bool isValidForm(){
    print(note.title);
    print(note.description);

    return formKey.currentState?.validate() ?? false;
  }

}