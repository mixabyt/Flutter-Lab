import 'package:flutter/material.dart';
import 'package:flutter_lab_13/AppDB.dart';

class Notesscreen extends StatefulWidget {
  const Notesscreen({super.key});

  @override
  State<Notesscreen> createState() => _NotesscreenState();
}

class  _NotesscreenState extends State<Notesscreen> {

  List<Map<String, dynamic>> notes = [];
  bool loading = true;
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    final data = await AppDatabase.instance.getNotes();

    setState(() {
      notes = data;
      loading = false;
    });
  }

  Future<void> addNote() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    await AppDatabase.instance.addNote("Note", text);
    _controller.clear();

    await loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Form(
                  key: _FormKey,
                  child:  TextFormField(
                  controller: _controller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Поле не може бути порожнім';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Введіть текст нотатки",
                  ),
                )
                
                )
              ),

              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (_FormKey.currentState!.validate()) {
                    addNote();
                  } 
                },
                child: const Text("Додати"),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (_, i) {
              final note = notes[i];
              return Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
                ),
                child: ListTile(
                  title: Text(note['text']),
                  trailing: Text(note['created_at']),
                ),
              );
            },
          ),
        ),

      ],
    );
  }


  

}