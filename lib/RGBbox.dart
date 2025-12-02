import 'package:flutter/material.dart';
import 'package:flutter_lab_11/providers/RgbModel.dart';
import 'package:provider/provider.dart';

class  Rgbbox extends StatelessWidget {
  

  const Rgbbox({super.key});
  @override
  Widget build(BuildContext context) {
  final rgb = Provider.of<RgbModel>(context);
    return Container(
      width: 200,
      height: 200,
      color: Color.fromRGBO(rgb.red.toInt(), rgb.green.toInt(), rgb.blue.toInt(), 1),
    );
  }
}