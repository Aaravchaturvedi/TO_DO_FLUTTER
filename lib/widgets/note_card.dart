import 'package:flutter/material.dart';
import '../models/note.dart';
import '../screens/note_detail_screen.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NoteDetailScreen(note: note),
          ),
        );
      },
      child: Card(
        color: Colors.yellow[100],
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              note.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}