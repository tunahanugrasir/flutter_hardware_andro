import 'package:flutter/material.dart';

import 'state_learn_view_model.dart';

class StateLearnView extends StatefulWidget {
  const StateLearnView({ Key? key }) : super(key: key);

  @override
  State<StateLearnView> createState() => _StateLearnViewState();
}

class _StateLearnViewState extends StateLearnViewModel {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      
    );
  }
}