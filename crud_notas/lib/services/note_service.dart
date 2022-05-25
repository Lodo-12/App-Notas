import 'package:flutter/material.dart';
import 'package:crud_notas/models/models.dart';


class NotesService extends ChangeNotifier{
  
  final String _baseUrl = 'notasv4-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Notes> notes =[];


}