import 'package:broadway_example_ui/note/note_database.dart';
import 'package:broadway_example_ui/note/note_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  void showAddEditBottomSheet(NoteModel? notes) {
    final titleController = TextEditingController(text: notes?.title ?? "");
    final descriptionController = TextEditingController(
      text: notes?.description ?? "",
    );
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
                  // notes == null ? print("isnull") : print("notNull");
                  final note = NoteModel(
                    id: notes?.id,
                    title: titleController.text,
                    description: descriptionController.text,
                  );
                  if (notes == null) {
                    int result = await database.insert(note);
                    if (result > 0) {
                      getData();
                    }
                  } else {
                    int result = await database.updateData(note);
                    if (result > 0) {
                      getData();
                    }
                  }
                  // Fluttertoast.showToast(
                  //   msg: "Data added sucessfully",
                  //   toastLength: Toast.LENGTH_LONG,
                  //   gravity: ToastGravity.CENTER,
                  //   timeInSecForIosWeb: 1,
                  //   backgroundColor: Colors.green,
                  //   textColor: Colors.white,
                  //   fontSize: 16.0,
                  // );

                  // Navigator.pop(context);
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
          showAddEditBottomSheet(null);
        },
        child: Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () => getData(),
        child: Column(
          children: [
            Expanded(
              child: notes.isEmpty
                  ? Text("No Notes to display")
                  : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final noteData = notes[index];
                        return Container(
                          margin: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: IconButton(
                              onPressed: () {
                                showAddEditBottomSheet(noteData);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            title: Text(noteData.title),
                            subtitle: Text(noteData.description),
                            trailing: IconButton(
                              onPressed: () async {
                                final result = await database.delete(
                                  noteData.id ?? 0,
                                );
                                if (result > 0) {
                                  getData();
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Delete successfully"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
