import 'package:flutter/material.dart';
import 'package:noteapp/models/note.dart';
import 'package:noteapp/screens/widgets/note_view.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: NoteView(
        titleController: _titleController,
        notesController: _notesController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_titleController.text.isNotEmpty && _notesController.text.isNotEmpty) {
            widget.onNewNoteCreated(Note(
              title: _titleController.text,
              notes: _notesController.text,
            ));
          }
          else if(_titleController.text.isEmpty){
            widget.onNewNoteCreated(Note(
              title: 'Title',
              notes: _notesController.text,
            ));
          }
          else if(_notesController.text.isEmpty){
            widget.onNewNoteCreated(Note(
              title: _titleController.text,
              notes: "",
            ));
          }
          else {
            widget.onNewNoteCreated(Note(
              title: 'Title',
              notes: "",
            ));
          }
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}