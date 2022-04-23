import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/product/language/language_items.dart';

class CounterHello extends StatefulWidget {
  const CounterHello({Key? key}) : super(key: key);

  @override
  State<CounterHello> createState() => _CounterHelloState();
}

class _CounterHelloState extends State<CounterHello> {
  final String _welcomeTitle = LanguageItems.welcomeTitle;
  int _helloCounter = 0;
  void _helloCounterControl() {
    setState(() {
      ++_helloCounter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _helloCounterControl,
      child: Text('$_welcomeTitle $_helloCounter'),
    );
  }
}
