
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crud_notas/models/notes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NotesService extends ChangeNotifier{
  
  final String _baseUrl = 'notasv2-27921-default-rtdb.firebaseio.com';
  final List<Nota> notes =[];
   Nota selectedNote = Nota(description: '', title: '');

  final storage = new FlutterSecureStorage();
  
  bool isLoading = true;
  bool isSaving = false;

  NotesService(){
    this.loadNotes();
  }


Future<List<Nota>> loadNotes() async{

print(loadNotes());
//   this.isLoading = true;
//   notifyListeners();

//   final url = Uri.https(_baseUrl, 'notes.json',{
//     'auth': await storage.read(key: 'token') ?? ''
//   });
//   final resp = await http.get(url);

//   final Map<String, dynamic> notesMap = json.decode(resp.body);

//   notesMap.forEach((key, value) {
//   final tempNote = Nota.fromMap(value);
//   tempNote.id= key;
//   this.notes.add(tempNote);    

//   }
// );

// this.isLoading = false;
// notifyListeners();

return this.notes;

}

Future saveOrCreateNote( Nota note) async{

  isSaving= true;
  notifyListeners();

  if( note.id == null){

    await this.createNotes(note);
  } else{

    await this.updateNotes(note);

  }

  isSaving= false;
  notifyListeners();

}

Future<String> updateNotes (Nota note) async {

 final url = Uri.https(_baseUrl, 'notes/${ note.id}.json');
 final resp = await http.put(url, body:note.toJson() );
 final decodedData = resp.body;


  final index = this.notes.indexWhere((element) => element.id ==note.id);
  this.notes[index] = note;

return note.id!;
}


Future<String> createNotes (Nota note) async {

 final url = Uri.https(_baseUrl, 'notes.json');
 final resp = await http.post(url, body:note.toJson() );
 final decodedData = json.decode(resp.body);

note.id = decodedData['title'];
  // this.products.add(product);

return note.id!;
 }
  
}
