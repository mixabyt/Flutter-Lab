import 'package:flutter/material.dart';


class CustomizeContainerScreen extends StatefulWidget{
  const CustomizeContainerScreen({super.key});

  @override
  State<CustomizeContainerScreen> createState() => _CustomizeContainerScreenState();
}

class _CustomizeContainerScreenState extends State<CustomizeContainerScreen> {
  double _width = 10;
  double _height = 10;
  double _upRightRadius = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lab7', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white ),),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
          child: SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(_upRightRadius),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Text("Width: ${_width.toStringAsFixed(2)}"),
          Slider(value: _width, 
          min: 0,
          max: 100,
          onChanged: (value) {
            setState(() {
              _width = value;
            });
          }),
          Text("Height: ${_height.toStringAsFixed(2)}"),
          Slider(value: _height, 
          min: 0,
          max: 100,
          onChanged: (value) {
            setState(() {
              _height = value;
            });
          }),
          Text("Upper Right Radius: ${_upRightRadius.toStringAsFixed(2)}"),
          Slider(value: _upRightRadius,
          min: 0,
          max: 100,
          onChanged: (value) {
            setState(() {
              _upRightRadius = value;
            });
          }),
          
        
          
        ],
      ),
      
      )
    );
  }
}