import 'package:flutter/material.dart';
import 'package:notx/common/notes/models/notes.dart';
import 'package:notx/features/list/widgets/delete_button.dart';
import 'package:notx/features/view/screens/view_screen.dart';

class NoteWidget extends StatelessWidget {
  final Notes note;

  const NoteWidget({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewScreen(note: note),
            ),
          );
        },
        title: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            note.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            note.content,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        trailing: DeleteButton(note: note),
      ),
    );
  }
}
