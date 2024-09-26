import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController notesController;

  const NoteView({
    super.key,
    required this.titleController,
    required this.notesController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            controller: titleController,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
              hintText: 'Title',
              border: InputBorder.none,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: notesController,
              maxLines: null,
              expands: true,
              style: const TextStyle(
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                hintText: 'Notes',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}