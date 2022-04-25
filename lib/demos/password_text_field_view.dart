import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/demos/password_text_field.dart';

class PasswordTextFieldViewLearn extends StatelessWidget {
  const PasswordTextFieldViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: PasswordTextField()),
    );
  }
}
