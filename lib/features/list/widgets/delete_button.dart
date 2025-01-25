import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notx/common/notes/bloc/note_bloc.dart';
import 'package:notx/common/notes/models/notes.dart';
import 'package:notx/common/theme/app_pallete.dart';
import 'package:notx/common/theme/bloc/theme_bloc.dart';

class DeleteButton extends StatelessWidget {
  final Notes note;

  const DeleteButton({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.select((ThemeBloc bloc) => bloc.state);

    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Delete Note',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              content: const Text('Are you sure you want to delete this note?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    context.read<NoteBloc>().add(DeleteNoteEvent(note.id!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Note Deleted'),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: isDark
                          ? AppPallete.darkDeleteButton
                          : AppPallete.lightDeleteButton,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(
        Icons.delete,
        size: 28,
      ),
    );
  }
}
