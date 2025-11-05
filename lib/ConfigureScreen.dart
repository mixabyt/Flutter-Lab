import 'package:flutter/material.dart';
import 'package:lab10/PreviewScreen.dart';
import 'package:lab10/img.dart';

class Configurescreen extends StatefulWidget {
  const Configurescreen({super.key});

  @override
  State<Configurescreen> createState() => _ConfigurescreenState();
}

class _ConfigurescreenState extends State<Configurescreen> {
  double _fontsize = 16;
  final textfieldcontroller = TextEditingController();
  bool input = false;

  Future<void> _openPreview() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Previewscreen(
          title: textfieldcontroller.text,
          fontsize: _fontsize,
        ),
      ),
    );

    if (!mounted) return;

    String message;
    if (result == 'ok') {
      message = 'OK!';
    } else if (result == 'cancel') {
      message = "Let’s try something else.";
    } else {
      message = "Don't know what to say.";
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Image.network(ImgURL.robopic, height: 50),
        
        actions: [
          Center(child: Text(message, textAlign: TextAlign.center)),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    setState(() {
      input = false;
      textfieldcontroller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text Previewer",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 174, 99, 187),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: textfieldcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter configuration',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "Enter some text",
                  style: TextStyle(
                    color: input ? Colors.red : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("Font Size: ${_fontsize.toInt()}"),
                  Expanded(
                    child: Slider(
                      value: _fontsize,
                      min: 1,
                      max: 100,
                      onChanged: (value) {
                        setState(() {
                          _fontsize = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 50),
                    
                  ),
                  onPressed: () {
                    if (textfieldcontroller.text.isEmpty) {
                      setState(() => input = true);
                      return;
                    }
                    _openPreview();
                  },
                  child: const Text(
                    'Preview',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
