import 'package:flutter/material.dart';
import 'package:noteapp/models/note.dart';
import 'package:noteapp/screens/create_note.dart';
import 'package:noteapp/screens/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
            note: notes[index], 
            index: index, 
            onNoteEdited: (context) => onNoteEdited(context, index), 
            onNoteDeleted: (context) => onNoteDeleted(context),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNote(
            onNewNoteCreated: onNewNoteCreated,
          )));
        },
        backgroundColor: Colors.white, 
        child: const Icon(Icons.add, color: Colors.black,), 
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void onNoteEdited(Note note, int index) {
    setState(() {
      notes[index] = note;
    });
  }

  void onNoteDeleted(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
}