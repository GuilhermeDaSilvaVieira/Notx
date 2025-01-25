part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();
}

class GetAllNotesEvent extends NoteEvent {
  @override
  List<Object> get props => [];
}

class AddNoteEvent extends NoteEvent {
  final Notes notes;
  const AddNoteEvent(this.notes);

  @override
  List<Object> get props => [notes];
}

class UpdateNoteEvent extends NoteEvent {
  final Notes notes;
  const UpdateNoteEvent(this.notes);

  @override
  List<Object> get props => [notes];
}

class DeleteNoteEvent extends NoteEvent {
  final int id;
  const DeleteNoteEvent(this.id);

  @override
  List<Object> get props => [id];
}
