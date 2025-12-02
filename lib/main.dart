import 'package:flutter/material.dart';
import 'package:flutter_lab_11/providers/RgbModel.dart';
import 'package:provider/provider.dart';
import 'Sliders.dart';
import 'RGBbox.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ChangeNotifierProvider(
              create: (_) => RgbModel(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Rgbbox(),
                  Sliders(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
