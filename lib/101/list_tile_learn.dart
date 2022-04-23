import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:  [
            Card(
              child: ListTile(
                title: const RandomImage(),
                subtitle: const Text('How do you use your card?'),
                leading: const Icon(Icons.money),
                trailing: const Icon(Icons.chevron_right_outlined),
                onTap: (){},
                dense: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
