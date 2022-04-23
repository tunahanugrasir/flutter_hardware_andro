import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/product/language/language_items.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        FittedBox(
            child: Text(
          LanguageItems.welcomeTitle,
          style: Theme.of(context).textTheme.headline1,
          maxLines: 1,
        )),
        Container(
          height: 300,
          color: Colors.yellow[700],
        ),
        const Divider(),
        SizedBox(
          height: 300,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            Container(width: MediaQuery.of(context).size.width/2, color: Colors.blue[700]),
            Container(width: MediaQuery.of(context).size.width, color: const Color.fromARGB(255, 11, 216, 235)),
            Container(width: MediaQuery.of(context).size.width, color: const Color.fromARGB(255, 236, 148, 7)),
          ]),
        ),
        const Divider(),
        Container(
          height: 300,
          color: Colors.green[700],
        ),
        const Divider(),
        Container(
          height: 300,
          color: Colors.amberAccent[700],
        ),
      ]),
    );
  }
}
