import 'package:flutter/material.dart';
import 'package:noteapp/models/note.dart';
import 'package:noteapp/screens/widgets/note_view.dart';

class EditNote extends StatefulWidget {
  const EditNote({
    super.key,
    required this.note,
    required this.onNoteEdited,
  });

  final Note note;
  final Function(Note) onNoteEdited;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late TextEditingController _titleController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _notesController = TextEditingController(text: widget.note.notes);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveNote() {
    final updatedNote = Note(
      title: _titleController.text,
      notes: _notesController.text,
    );
    widget.onNoteEdited(updatedNote);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: NoteView(
        titleController: _titleController,
        notesController: _notesController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveNote,
        child: const Icon(Icons.save),
      ),
    );
  }
}