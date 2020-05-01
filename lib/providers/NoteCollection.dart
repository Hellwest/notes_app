import 'package:notes_app/models/Note.dart';

class NotCollection {
  final List<Note> _notes = [
  ];

  get count => _notes.length;

  get allNotes => _notes;
}