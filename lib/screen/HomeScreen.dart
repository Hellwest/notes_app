import 'package:flutter/material.dart';
import 'package:notes_app/models/Note.dart';
import 'package:notes_app/providers/NoteCollection.dart';
import 'package:notes_app/screen/NoteScreen.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  var uuid = new Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<NoteCollection>(
          builder: (context, notes, child) {
            if (notes.count == 0) {
              return Text('Notes');
            }
            
            return Text('Notes (${notes.count})');
          },
        )
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

            return Dismissible(
              key: Key(note.id),
              onDismissed: (direction) {
                Provider.of<NoteCollection>(context).deleteNote(note.id);
              },
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                title: Text(note.noteBody),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NoteScreen(
                        note: note,
                      ),
                    )
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}