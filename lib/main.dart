import 'package:flutter/material.dart';
import 'package:flutter_lab_14/NativeMehodService.dart';
import 'package:flutter_lab_14/camera_page.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool show = false;
   String? nativeData;
  @override
  void initState() {
    super.initState();
    Nativemehodservice.randomString().then((value) {
      nativeData = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Method Example'),
        ),
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CameraPage(),
              
              ElevatedButton(onPressed: () {
                show = !show;
                setState(() {});
              },
              child: const Text('Get Native Data')),
              const SizedBox(height: 20),
              if (show)
                Text(nativeData ?? 'Loading...'),
            ],
          )
        ),
        
      )
    );
  }
}
