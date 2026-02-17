import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class CameraPage extends StatefulWidget{
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? image;
  final picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(        
        children: [
          if (image != null)
            Image.file(image!)
          else
            const Text('No image selected.'),
          const SizedBox(height: 20),
          FloatingActionButton(
          onPressed: () => pickImage(ImageSource.camera),
          child: const Icon(Icons.camera_alt),
          ),    
        ],
      );
    
  }
}