import 'package:flutter/material.dart';
import 'package:noteapp/models/note.dart';
import 'package:noteapp/screens/edit_note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    required this.index,
    required this.onNoteEdited,
    required this.onNoteDeleted,
  });

  final Note note;
  final int index;
  final Function(Note) onNoteEdited;
  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditNote(
              note: note,
              onNoteEdited: (updatedNote) {
                onNoteEdited(updatedNote);
              },
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(note.title),
          subtitle: Text(
            note.notes,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onNoteDeleted(index);
            },
          ),
        ),
      ),
    );
  }
}
