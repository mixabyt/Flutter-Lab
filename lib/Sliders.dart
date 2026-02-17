import 'package:flutter/material.dart';
import 'package:flutter_lab_11/providers/RgbModel.dart';
import 'package:provider/provider.dart';

class Sliders extends StatefulWidget {
  const Sliders({super.key});

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  @override
  Widget build(BuildContext context) {
    final rgb = Provider.of<RgbModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Red: ${rgb.red.toStringAsFixed(0)}"),
          Slider(value: rgb.red, 
          min: 0,
          max: 255,
          onChanged: (value) {
            setState(() {
              rgb.setRed(value);
            });
          }),

        Text("Green: ${rgb.green.toStringAsFixed(0)}"),
          Slider(value: rgb.green, 
          min: 0,
          max: 255,
          onChanged: (value) {
            setState(() {
              rgb.setGreen(value);
            });
          }),

        Text("Blue: ${rgb.blue.toStringAsFixed(0)}"),
          Slider(value: rgb.blue, 
          min: 0,
          max: 255,
          onChanged: (value) {
            setState(() {
              rgb.setBlue(value);
            });
          }),
      ],
    );
  }
}