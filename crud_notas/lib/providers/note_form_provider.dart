import 'package:crud_notas/models/notes.dart';
import 'package:flutter/material.dart';

class NoteFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Nota note;

  NoteFormProvider( this.note );

  bool isValidForm(){
    print(note.title);
    print(note.description);

    return formKey.currentState?.validate() ?? false;
  }

}