import 'package:broadway_example_ui/note/note_database.dart';
import 'package:broadway_example_ui/note/note_model.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  NoteDatabase database = NoteDatabase();
  List<NoteModel> notes = [];

  Future<void> getData() async {
    final nt = await database.getData();
    setState(() {
      notes = nt;
    });
  }

  void showAddEditBottomSheet() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Notes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  label: Text("Decription"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final note = NoteModel(
                    title: titleController.text,
                    description: descriptionController.text,
                  );
                  int result = await database.insert(note);
                  if (result > 0) {
                    getData();
                  }
                },
                child: Text("Add"),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note screen")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddEditBottomSheet();
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final noteData = notes[index];
                return ListTile(
                  title: Text(noteData.title),
                  subtitle: Text(noteData.description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
