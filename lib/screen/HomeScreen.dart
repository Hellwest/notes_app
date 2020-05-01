import 'package:flutter/material.dart';
import 'package:notes_app/providers/NoteCollection.dart';

class HomeScreen extends StatelessWidget {
  var collection = NotCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes")
      ),

      body: _buildNotesList()
    );
  }

  Widget _buildNotesList() {
    var allNotes = collection.allNotes;

    if (allNotes.length == 0) {
      return Center(
        child: Text('No notes'),
      );
    }
    
    return ListView.builder(
      itemCount: allNotes.length,
      itemBuilder: (context, index) {
        var note = allNotes[index];

        return ListTile(
          title: Text(note.body),
        );
      },
    );
  }
}