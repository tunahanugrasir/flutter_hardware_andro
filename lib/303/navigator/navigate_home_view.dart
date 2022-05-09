import 'package:flutter/material.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({ Key? key }) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(toString())),
    );
  }
}