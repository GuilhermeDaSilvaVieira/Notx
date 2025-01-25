import 'package:flutter/material.dart';
import 'package:notx/common/notes/models/notes.dart';
import 'package:notx/features/view/widgets/edit_note_button.dart';

class ViewScreen extends StatelessWidget {
  final Notes note;

  const ViewScreen({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(note.title),
        ),
        actions: [
          EditNoteButton(note: note),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                note.content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (note.lastModified != null)
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodySmall,
                          children: [
                            const TextSpan(text: 'Last modified: '),
                            TextSpan(
                              text: note.lastModified!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          const TextSpan(text: 'Created at: '),
                          TextSpan(
                            text: note.createdAt,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
