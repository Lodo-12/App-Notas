import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crud_notas/models/models.dart';
import 'package:http/http.dart' as http;

class NotesService extends ChangeNotifier{
  
  final String _baseUrl = 'notasv4-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Notes> notes =[];
  late Notes? selectedNote;

  bool isLoading = true;
  bool isSaving = false;

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

  Future saveOrCreateNote( Notes notes) async{

  isSaving= true;
  notifyListeners();

  if( notes.id == null){

    await this.createNote(notes);
  } else{

    await this.updateNote(notes);

  }

  isSaving= false;
  notifyListeners();

}

Future<String> updateNote (Notes notes) async {

 final url = Uri.https(_baseUrl, 'notas/${ notes.id}.json');
 final resp = await http.put(url, body:notes.toJson() );
 final decodedData = resp.body;


  final index = this.notes.indexWhere((element) => element.id ==notes.id);
  this.notes[index] = notes;

return notes.id!;
}

Future<String?> createNote (Notes notes) async {

 final url = Uri.https(_baseUrl, 'notas.json');
 final resp = await http.post(url, body:notes.toJson() );
 final decodedData = json.decode(resp.body);

notes.id = decodedData['title'];
  // this.notes.add(notes);

return notes.id;
 }

 Future<String> deleteNote (Notes notes) async {
   
final url = Uri.https(_baseUrl, 'notas/${ notes.id}.json');
 final resp = await http.delete(url);
 final decodedData = json.decode(resp.body);

notes.id = decodedData['title'];
  // this.notes.add(notes);

notifyListeners();
  return notes.id!;
 
  }

}


