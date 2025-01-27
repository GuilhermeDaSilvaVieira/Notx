import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notx/common/notes/bloc/note_bloc.dart';
import 'package:notx/features/list/widgets/empty_list.dart';
import 'package:notx/features/list/widgets/note_widget.dart';

class NoteList extends StatefulWidget {
  const NoteList({
    super.key,
  });

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => context.read<NoteBloc>().add(GetAllNotesEvent()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        if (state is NoteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NoteLoaded) {
          return state.allNotes.isEmpty
              ? const EmptyList()
              : ListView.builder(
                  itemCount: state.allNotes.length,
                  itemBuilder: (context, index) =>
                      NoteWidget(note: state.allNotes[index]),
                  padding: const EdgeInsets.all(12),
                );
        } else if (state is NoteFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
