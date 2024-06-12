import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/components/drawer.dart';
import 'package:notes_app/components/note_tile.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    readNotes();
  }

  void createNote(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [
            // create button
            MaterialButton(
                onPressed: () {
                  // add to db
                  context.read<NoteDatabase>().addNote(textController.text);

                  // clear controller
                  textController.clear();

                  Navigator.pop(context);
                },
              child: const Text("Create"),
            ),
          ],
        ),
    );
  }

  // read note
  void readNotes(){
    context.read<NoteDatabase>().fetchNotes();
  }

  // update note
  void updateNote(Note note){
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Update Note"),
          content: TextField(controller: textController),
          actions: [
            MaterialButton(
                onPressed: () {
                  context
                  .read<NoteDatabase>()
                      .updateNote(note.id, textController.text);

                  //clear controller
                  textController.clear();
                  // pop dialog box
                  Navigator.pop(context);
                },
              child: const Text("Update"),
            ),
          ],
        ),
    );
  }

  // delete a note
  void deleteNote(int id){
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

            ),
          ),
          
          
          
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
                itemBuilder: (context, index){
                // get individual note
                  final note = currentNotes[index];
            
                  // list tile UI
                  return NoteTile(
                      text: note.text,
                    onEditPressed: () => updateNote(note),
                    onDeletePressed: () => deleteNote(note.id),
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}
