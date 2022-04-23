import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/demos/color_demo.dart';

class ColorLifeCycleDemo extends StatefulWidget {
  const ColorLifeCycleDemo({Key? key}) : super(key: key);

  @override
  State<ColorLifeCycleDemo> createState() => _ColorLifeCycleDemoState();
}

class _ColorLifeCycleDemoState extends State<ColorLifeCycleDemo> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: _changeBakgroundColor,
            icon: const Icon(Icons.clear))
      ]),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
              child: ColorDemo(
            initialColor: _backgroundColor,
          ))
        ],
      ),
    );
  }

  void _changeBakgroundColor() {
            setState(() {
              _backgroundColor = Colors.pink;
            });
          }
}
