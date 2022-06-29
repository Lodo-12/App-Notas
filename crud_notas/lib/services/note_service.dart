import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:crud_notas/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NotesService extends ChangeNotifier{
  
  final String _baseUrl = 'notasv4-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Notes> notes =[];
  late Notes? selectedNote;
  final storage = new FlutterSecureStorage();

  bool isLoading = true;
  bool isSaving = false;

  NotesService(){
      this.loadNotes();
    }

  
Future<List<Notes>> loadNotes() async{

  this.isLoading = true;
  notifyListeners();

  final url = Uri.https(_baseUrl, 'notes.json',{
    'auth': await storage.read(key: 'token') ?? ''
  });

  final resp = await http.get(url);

  final Map<String, dynamic> notesMap = json.decode(resp.body);

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

 final url = Uri.https(_baseUrl, 'notes/${ notes.id}.json');
 final resp = await http.put(url, body:notes.toJson() );
 final decodedData = resp.body;


  final index = this.notes.indexWhere((element) => element.id ==notes.id);
  this.notes[index] = notes;

return notes.id!;
}

Future<String?> createNote (Notes notes) async {

 final url = Uri.https(_baseUrl, 'notes.json');
 final resp = await http.post(url, body:notes.toJson() );
 final decodedData = json.decode(resp.body);

notes.id = decodedData['title'];

return notes.id;
 }

<<<<<<< HEAD
  Future<String> deleteNote(Notes notes) async{
=======
 Future<String> deleteNote (Notes notes) async {
   
   
 final url = Uri.https(_baseUrl, 'notes/${ notes.id}.json');
 final resp = await http.delete(url, body:notes.toJson() );
 final decodedData = json.decode(resp.body);

notifyListeners();
  return notes.id!;
>>>>>>> parent of 4954291 (arreglosv1)
 
   final url = Uri.https(_baseUrl, 'notes/${ notes.id}.json');
   final resp = await http.delete(url,body:notes.toJson()); ////Peticion Delete 
   final decodedData = json.decode(resp.body);
  
   notifyListeners();
   return notes.id!;
 
 
 }

//  Future<String> deleteNote (Notes notes) async {

//   isSaving = true;
//   notifyListeners();
  
//  final url = Uri.https(_baseUrl, 'notes/${ notes.id}.json');
//  final resp = await http.delete(url, body:notes.toJson());
//  final decodedData = json.decode(resp.body);

//   isSaving = false;
//   notifyListeners();
//   return notes.id!;
 
//   }

  Future<void> refreshNotes() {
    final duracion = Duration(seconds: 1);
    Timer(duracion, () {
      notes.clear();
       loadNotes();
    });

    return Future.delayed(duracion);
  }

}


