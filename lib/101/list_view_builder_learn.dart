import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/core/random_image.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: ((context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                children: [
                 const Expanded(child:  RandomImage()),
                  Expanded(child: Text('$index'))
                ],
              ),
            );
          }),
          separatorBuilder: (contex, index) {
            return Center(child: Text('$index'));
          },
          itemCount: 30),
    );
  }
}
