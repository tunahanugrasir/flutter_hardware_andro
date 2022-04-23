import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/demos/notes_demo.dart';
import 'package:flutter_hardware_andro/demos/stack_demo.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _controller = PageController();
  int _currentPageIndex = 0;
  void _nextPage() {
    _controller.nextPage(duration: CustomDuration._normalDuration, curve: Curves.easeInToLinear);
  }

  void _previousPage() {
    _controller.previousPage(duration: CustomDuration._normalDuration, curve: Curves.elasticOut);
  }

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(_currentPageIndex.toString()),
        ),
        FloatingActionButton(onPressed: _previousPage, child: const Icon(Icons.chevron_left)),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: FloatingActionButton(onPressed: _nextPage, child: const Icon(Icons.chevron_right)),
        ),
      ]),
      body: PageView(
        controller: _controller,
        onPageChanged: _updatePageIndex,
        children: const [
          NotesDemo(),
          StackDemo(),
        ],
      ),
    );
  }
}

class CustomDuration {
  static const _normalDuration = Duration(seconds: 1);
}
