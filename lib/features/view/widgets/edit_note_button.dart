import 'package:flutter/material.dart';
import 'package:notx/common/notes/models/notes.dart';
import 'package:notx/features/modify/screen/modify_screen.dart';

class EditNoteButton extends StatelessWidget {
  final Notes note;

  const EditNoteButton({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ModifyScreen(
              title: 'Edit Note',
              note: note,
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.edit,
      ),
    );
  }
}
