// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import '../product/widgets/buttons/answer_button.dart';
import '../product/widgets/buttons/loading_button.dart';
import '../product/widgets/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CallbackDropDown(onUserSelected: ((CallBackUser user) {
            inspect(user);
          })),
          AnswerButton(
            onNumber: (number) {
              return number % 2 == 1;
            },
          ),
          LoadingButton(
            title: 'Save',
            callback: () async {
              await Future.delayed(const Duration(seconds: 2));
            },
          )
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser(this.name, this.id);

  static List<CallBackUser> dummyUser() {
    return [
      CallBackUser('tuna', 7),
      CallBackUser('nil', 3),
      CallBackUser('han', 10),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallBackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
