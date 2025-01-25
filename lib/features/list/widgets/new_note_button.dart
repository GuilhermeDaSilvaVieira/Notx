import 'package:flutter/material.dart';
import 'package:notx/features/modify/screen/modify_screen.dart';

class NewNoteButton extends StatelessWidget {
  const NewNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ModifyScreen(title: 'New Note'),
          ),
        );
      },
      icon: const Icon(
        Icons.add,
      ),
    );
  }
}
