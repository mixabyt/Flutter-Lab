import 'package:flutter/material.dart';
import 'package:flutter_lab_13/NotesScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          title: Text("Notes App"),
        ),
        body: Notesscreen(),
      ),
    );
  }
}
