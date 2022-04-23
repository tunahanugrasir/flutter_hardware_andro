import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/product/counter_hello.dart';

class StatefulLearn extends StatefulWidget {
  const StatefulLearn({Key? key}) : super(key: key);

  @override
  State<StatefulLearn> createState() => _StatefulLearnState();
}

class _StatefulLearnState extends State<StatefulLearn> {
  int _counter = 0;

  void _counterControl(bool isIncrement) {
    if (isIncrement) {
      _counter = _counter + 1;
    } else {
      _counter = _counter - 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
              onPressed: (() {
                _counterControl(true);
              }),
              child: const Icon(Icons.add)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FloatingActionButton(
                onPressed: (() {
                  _counterControl(false);
                }),
                child: const Icon(Icons.remove)),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(_counter.toString(), style: Theme.of(context).textTheme.headline5)),
          const CounterHello()
        ],
      ),
    );
  }
}
