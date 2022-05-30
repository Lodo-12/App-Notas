import 'dart:js';

import 'package:crud_notas/services/services.dart';
import 'package:flutter/material.dart';
import 'package:crud_notas/screens/loading_screen.dart';
import 'package:crud_notas/models/notes.dart';
import 'package:crud_notas/screens/screens.dart';
import 'package:crud_notas/services/note_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:crud_notas/models/models.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  List<Notes> notes = [];  

  @override
  Widget build(BuildContext context) {
  final Notes notes;
  final notesService = Provider.of<NotesService>(context);
  final authservice = Provider.of<Authservice>(context, listen: false);

  if( notesService.isLoading) return LoadingScreen();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 24, 18),
      appBar: AppBar(
        title: Text('Notas'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
           icon: Icon(Icons.login_outlined),
           onPressed: (){

             authservice.logout();
             Navigator.pushReplacementNamed(context, 'login');

           }
           ),
      ),
      body: ListView.builder(
        itemCount: notesService.notes.length,
       itemBuilder: (BuildContext context, int index)=>GestureDetector(
          onTap: (){
            notesService.selectedNote = notesService.notes[index].copy();
            Navigator.pushNamed(context, 'note');
            _DeleteNote(index);
          },
          child: _NotesCard(
            note:notesService.notes[index],
          )
            ),
          ),
           floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white10,
        onPressed: () { 
             
             notesService.selectedNote = new Notes(
               description: '',
                title: '');

            Navigator.pushNamed(context, 'note');
         },
        child: Icon(
           CupertinoIcons.add,
           size: 30, 
           color: Colors.white),
      ),

      );
  }
  _DeleteNote(int i) {
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
    
      onDismissed: (direction) {
        print(direction);
        NotesService.deleteNote(notes[i]);
      }, child:  ListTile(
        title: Text(notes[i].title),
        trailing: MaterialButton(
          onPressed: (){
            // Navigator.pushNamed(context, SavePage.ROUTE,arguments: notes[i]);
          deleteNote(notes.id);
                 Navigator.pop(context);
          },
          child: Icon(Icons.edit)),
      ),
    );
 }
}
class _NotesCard extends StatelessWidget {
  
  final Notes note;

  const _NotesCard({
    super.key,
     required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        //CHOOSE COLOR OF NOTES
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.title,
           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
           
           SizedBox(height: 5),

          Text(note.description,
           style: TextStyle(fontSize: 17))
        ],
          
        
      ),
    );
  }
}

