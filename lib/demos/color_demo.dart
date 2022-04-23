// bir ekran olacak
// 3 button bunlara basında renk değişcek
// secili olan buton selected icon olsun

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/product/language/language_items.dart';

class ColorDemo extends StatefulWidget {
  const ColorDemo({Key? key, required this.initialColor}) : super(key: key);
  final Color? initialColor;
  @override
  State<ColorDemo> createState() => _ColorDemoState();
}

class _ColorDemoState extends State<ColorDemo> {
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    inspect(widget);
    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: const [
        BottomNavigationBarItem(icon: _ColorfulIcon(), label: LanguageItems.yellowColor),
        BottomNavigationBarItem(icon: _ColorfulIcon(color: Colors.blue), label: LanguageItems.blueColor),
        BottomNavigationBarItem(icon: _ColorfulIcon(color: Colors.red), label: LanguageItems.redColor)
      ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    } else {
      changeBackgroundColor(Colors.red);
    }
  }
}

// ignore: unused_field
enum _MyColors { yellow, blue, red }

class _ColorfulIcon extends StatelessWidget {
  const _ColorfulIcon({
    Key? key,
    this.color = Colors.yellow,
  }) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.color_lens_outlined,
      color: color,
    );
  }
}
