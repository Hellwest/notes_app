import 'package:flutter/material.dart';
import 'package:notes_app/models/Note.dart';
import 'package:notes_app/providers/NoteCollection.dart';
import 'package:notes_app/screen/NoteScreen.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  var uuid = new Uuid();
  var collection = NoteCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes")
      ),

      body: _buildNotesList(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Note note = Note(
            id: uuid.v4()
          );

          Provider.of<NoteCollection>(context).addNote(note);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NoteScreen(
                note: note,
              )
            )
          );
        }
      ),
    );
  }

  Widget _buildNotesList() {
    return Consumer<NoteCollection>(
      builder: (context, notes, child) {
        var allNotes = notes.allNotes;

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
      },
    );
  }
}