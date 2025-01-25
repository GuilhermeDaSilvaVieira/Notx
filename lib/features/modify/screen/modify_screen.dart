import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notx/common/notes/bloc/note_bloc.dart';
import 'package:notx/common/notes/models/notes.dart';
import 'package:notx/features/view/screens/view_screen.dart';

class ModifyScreen extends StatefulWidget {
  final String title;
  final Notes? note;

  const ModifyScreen({
    super.key,
    required this.title,
    this.note,
  });

  @override
  State<ModifyScreen> createState() => _ModifyScreenState();
}

class _ModifyScreenState extends State<ModifyScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final String dateTimeNow =
      DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: titleController,
                style: Theme.of(context).textTheme.titleMedium,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextField(
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  minLines: 10,
                  maxLines: 999999999999999999,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: const InputDecoration(hintText: 'Content'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.trim().isNotEmpty &&
                      contentController.text.trim().isNotEmpty) {
                    if (widget.note == null) {
                      context.read<NoteBloc>().add(
                            AddNoteEvent(
                              Notes(
                                title: titleController.text.trim(),
                                content: contentController.text.trim(),
                                createdAt: dateTimeNow,
                              ),
                            ),
                          );
                      Navigator.pop(context);
                    } else {
                      final note = Notes(
                        id: widget.note!.id!,
                        title: titleController.text.trim(),
                        content: contentController.text.trim(),
                        createdAt: widget.note!.createdAt,
                        lastModified: dateTimeNow,
                      );
                      context.read<NoteBloc>().add(UpdateNoteEvent(note));
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewScreen(note: note),
                        ),
                      );
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Note Saved With Success'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Both fields must not be empty'),
                      ),
                    );
                  }
                },
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
