import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/202/model_learn.dart';

class ModelViewLearn extends StatefulWidget {
  const ModelViewLearn({Key? key}) : super(key: key);

  @override
  State<ModelViewLearn> createState() => _ModelViewLearnState();
}

class _ModelViewLearnState extends State<ModelViewLearn> {
  var user2 = PostLearnModel1(body: 'tuna', title: 'nil');
  @override
  void initState() {
    super.initState();
    //final user1 = PostModel(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user2.title ?? 'Not has any data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user2 = user2.copyWith(title: 'tuna', body: 'nil');
            user2.updateBody('efsun');
          });
        },
        child: const Icon(Icons.change_circle),
      ),
      body: Center(
        child: Text(user2.body ?? 'Not has any data'),
      ),
    );
  }
}
