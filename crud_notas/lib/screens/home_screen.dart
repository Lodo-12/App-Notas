import 'package:crud_notas/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:crud_notas/models/models.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  final noteOperation = Provider.of<NotesOperation>(context);


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 24, 18),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white10,
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddScreen(),));
         },
        child: Icon(
           CupertinoIcons.add,
           size: 30, 
           color: Colors.white),
      ),
      appBar: AppBar(
        title: Text('Notas'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: noteOperation.getNotes.length,
       itemBuilder: (BuildContext context, int index){
         return NotesCard(noteOperation.getNotes[index]);

       },
      
      )
     );
  }
}

class NotesCard extends StatelessWidget {
  
  final Note note;

  const NotesCard(this.note);

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