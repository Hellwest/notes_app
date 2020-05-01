import 'package:flutter/material.dart';
import 'package:notes_app/models/Note.dart';

class NoteCollection extends ChangeNotifier {
  final List<Note> _notes = [];

  get count => _notes.length;

  get allNotes => _notes;

  Note getNote(String id) {
    return _notes.where((note) => note.id == id).first;
  }

  void addNote(Note note) {
    _notes.add(note);

    notifyListeners();
  }

  void updateNote(String id, String body) {
    var currentNote = _notes.where((note) => note.id == id).first;

    currentNote.body = body;

    notifyListeners();
  }

  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);

    notifyListeners();
  }
}
