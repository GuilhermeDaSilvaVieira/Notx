import 'package:flutter/material.dart';
import 'package:notx/features/list/widgets/new_note_button.dart';
import 'package:notx/features/list/widgets/note_list.dart';
import 'package:notx/features/list/widgets/theme_switch.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 6),
          child: Text('All Notes'),
        ),
        actions: [
          const NewNoteButton(),
          const ThemeSwitch(),
        ],
      ),
      body: const NoteList(),
    );
  }
}
