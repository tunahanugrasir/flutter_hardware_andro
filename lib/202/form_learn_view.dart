import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  // ignore: prefer_final_fields
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          // ignore: avoid_print
          print('a');
        },
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  validator: FormFieldValidator().isNotEmpty,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'E-mail',
                  )),
              DropdownButtonFormField(items: const [
                DropdownMenuItem(child: Text('İstanbul'), value: 'a'),
                DropdownMenuItem(child: Text('İzmir'), value: 'b'),
                DropdownMenuItem(child: Text('Muğla'), value: 'c'),
              ], onChanged: (value) {}, validator: FormFieldValidator().isNotEmpty),
              ElevatedButton(
                  onPressed: () {
                    if (_key.currentState?.validate() ?? false) {
                      // ignore: avoid_print
                      print('okey');
                    }
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'Bu alan boş bırakılamaz';
}
