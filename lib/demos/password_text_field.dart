import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureText = '?';
  bool _isSecure = true;

  void _changeSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: _isSecure,
        obscuringCharacter: _obscureText,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.password],
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Password',
          suffixIcon: _onVisibilityIcon(),
        ));
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: _changeSecure,
      icon:  AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          crossFadeState:_isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1)),
    );
  }
}
