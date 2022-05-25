import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crud_notas/models/models.dart';
import 'package:http/http.dart' as http;

class NotesService extends ChangeNotifier{
  
  final String _baseUrl = 'notasv4-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Notes> notes =[];
  late Notes? selectedNote;

  bool isLoading = true;

  NotesService(){
      this.loadProducts();
    }

  
Future<List<Notes>> loadProducts() async{

  this.isLoading = true;
  notifyListeners();

  final url = Uri.https(_baseUrl, 'notas/.json');

  final resp = await http.get(url);

  final Map<String, dynamic> notesMap = jsonDecode(resp.body);

  notesMap.forEach((key, value) {
    
    final tempNote = Notes.fromMap(value);
    tempNote.id = key;
    this.notes.add(tempNote);
  });

  this.isLoading = false;
  notifyListeners();
  return this.notes;

  }

}


