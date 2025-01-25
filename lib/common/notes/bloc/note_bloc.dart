import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notx/common/notes/data/repository.dart';
import 'package:notx/common/notes/models/notes.dart';

part 'note_state.dart';
part 'note_event.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final Repository repository;

  NoteBloc(this.repository) : super(NoteInitial()) {
    on<GetAllNotesEvent>(_getAllNotes);
    on<AddNoteEvent>(_addNote);
    on<UpdateNoteEvent>(_updateNote);
    on<DeleteNoteEvent>(_deleteNote);
  }

  void _getAllNotes(GetAllNotesEvent event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final notes = await repository.getAllNotes();
      emit(NoteLoaded(notes));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  void _addNote(AddNoteEvent event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      Future.delayed(const Duration(seconds: 1));
      int res = await repository.addNote(
        Notes(
          title: event.notes.title,
          content: event.notes.content,
          createdAt: event.notes.createdAt,
        ),
      );

      if (res > 0) {
        emit(NoteAdd());
        add(GetAllNotesEvent());
      }
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  void _updateNote(UpdateNoteEvent event, Emitter<NoteState> emit) async {
    try {
      final note = await repository.updateNote(
        Notes(
          id: event.notes.id,
          title: event.notes.title,
          content: event.notes.content,
          createdAt: event.notes.createdAt,
          lastModified: event.notes.lastModified,
        ),
      );

      if (note > 0) {
        emit(NoteUpdate());
        add(GetAllNotesEvent());
      }
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  void _deleteNote(DeleteNoteEvent event, Emitter<NoteState> emit) async {
    try {
      final res = await repository.deleteNote(event.id);
      if (res > 0) {
        emit(NoteDelete());
        add(GetAllNotesEvent());
      }
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
