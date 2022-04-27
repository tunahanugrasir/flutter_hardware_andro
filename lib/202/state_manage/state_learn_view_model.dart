import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../services/post_model.dart';
import '../services/post_service.dart';
import 'state_learn_view.dart';

abstract class StateLearnViewModel extends State<StateLearnView> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  // ignore: unused_field
  late final IPostService _postService;

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

  // ignore: unused_element
  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);
    if (response.statusCode == HttpStatus.created) {
      name = 'Başarııılıı';
    }
    _changeLoading();
  }
}
