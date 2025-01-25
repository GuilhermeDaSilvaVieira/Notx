part of 'note_bloc.dart';

sealed class NoteState extends Equatable {
  const NoteState();
}

final class NoteInitial extends NoteState {
  @override
  List<Object> get props => [];
}

final class NoteLoading extends NoteState {
  @override
  List<Object> get props => [];
}

final class NoteLoaded extends NoteState {
  final List<Notes> allNotes;
  const NoteLoaded(this.allNotes);

  @override
  List<Object> get props => [allNotes];
}

final class NoteFailure extends NoteState {
  final String errorMessage;
  const NoteFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class NoteAdd extends NoteState {
  @override
  List<Object> get props => [];
}

final class NoteUpdate extends NoteState {
  @override
  List<Object> get props => [];
}

final class NoteDelete extends NoteState {
  @override
  List<Object> get props => [];
}
