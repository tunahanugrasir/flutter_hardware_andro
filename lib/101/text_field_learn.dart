import 'package:flutter/material.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: TextField(
                buildCounter: (context, {int? currentLength, bool? isFocused, int? maxLength}) {
                  return AnimatedContainer(
                    key: key,
                    duration: const Duration(seconds: 1),
                    height: 10,
                    width: 10.0 * (currentLength ?? 0),
                    color: Colors.green,
                  );
                },
                decoration: const InputDecoration(
                  prefixIcon:  Icon(Icons.mail),
                  border:  OutlineInputBorder(),
                  labelText: 'mail',
                ),
              ),
            )
          ],
        ));
  }
}
