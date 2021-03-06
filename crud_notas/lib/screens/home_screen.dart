
import 'package:flutter/material.dart';
import 'package:crud_notas/models/models.dart';
import 'package:crud_notas/models/notes.dart';
import 'package:crud_notas/screens/loading_screen.dart';
import 'package:crud_notas/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {
  
  bool isLoading = true;
  List<Notes> notes = [];  


  @override
  Widget build(BuildContext context) {
  final notesService = Provider.of<NotesService>(context);
  final authservice = Provider.of<Authservice>(context, listen: false);
  if( notesService.isLoading) return LoadingScreen();
  userNotes(notesService, authservice);
      return Scaffold(
      // backgroundColor: Color.fromARGB(255, 177, 141, 74),
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Notas'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amber.shade600,
        leading: IconButton(
           icon: Icon(Icons.login_outlined),
           onPressed: (){
            showDialog(
              context: context,
               builder: (context) => AlertDialog(
                title: Text('¿Quieres salir?'),
                actions: [
                  TextButton(
                   child: Text('CANCEL'),
                   onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                   child: Text('OK'),
                   onPressed: () {
                    authservice.logout();
                    Navigator.pushReplacementNamed(context, 'login');
                   } ,
                  )                     
                ],
               )
               );
               

             
           }
           ),
           actions: [
             RawMaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, 'loading');
              notes.clear();
              notesService.refreshNotes();
             },
              child: Icon(CupertinoIcons.refresh))
           ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
       itemBuilder: (BuildContext context, int index)=>GestureDetector(
          onTap: (){
            notesService.selectedNote = notes[index].copy();
            Navigator.pushNamed(context, 'edit');
          },
          child: _NotesCard(
            note: notes[index], 
          )
            ),
          ),
           floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white10,
        onPressed: () { 
             
             notesService.selectedNote = new Notes(
               description: '',
                title: '', 
               userid: authservice.getUserId(),
                );
            Navigator.pushNamed(context, 'note');
         },
        child: Icon(
           CupertinoIcons.add,
           size: 30, 
           color: Colors.white),
      ),

      );
  }

  void userNotes(NotesService notesService, Authservice authservice) {
    notesService.notes.forEach((element) { if ( element.userid == authservice.getUserId()){
      if(!notes.contains(element)){notes.add(element);}
    } });
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
