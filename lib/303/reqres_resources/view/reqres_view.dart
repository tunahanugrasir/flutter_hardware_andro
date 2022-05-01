
import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/product/extension/string_extension.dart';

import '../view_model/reqres_view_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: isLoading ? const CircularProgressIndicator() : null),
      body: ListView.builder(
          itemCount: resources.length,
          itemBuilder: ((context, index) {
            return Card(color: Color(resources[index].color?.colorValue ?? 0),child: Text(resources[index].name ?? ''));
          })),
    );
  }
}
