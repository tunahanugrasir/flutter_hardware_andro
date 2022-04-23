import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/202/services/post_model.dart';
import 'package:flutter_hardware_andro/202/services/post_service.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  late final PostService _postService;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

//! initsTate içinde await olamaz...
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);
    if (response.statusCode == HttpStatus.created) {
      name = 'Başarııılıı';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: TextField(
                  controller: _titleController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Title'))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: _bodyController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Body'))),
          Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: TextField(
                  textInputAction: TextInputAction.done,
                  controller: _userIdController,
                  autofillHints: const [AutofillHints.creditCardNumber],
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'ID'))),
          ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : (() {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            title: _titleController.text,
                            body: _bodyController.text,
                            userId: int.tryParse(_userIdController.text));
                        _addItemToService(model);
                      }
                    }),
              child: const Text('Send'))
        ],
      ),
    );
  }
}
