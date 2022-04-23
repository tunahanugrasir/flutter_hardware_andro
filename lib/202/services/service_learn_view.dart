import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/202/services/post_model.dart';
import 'package:flutter_hardware_andro/202/services/post_service.dart';

import 'comment_learn_view.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final IPostService _postService;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
//! initsTate içinde await olamaz...
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));

    _postService = PostService();
    fetchPostItems();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _items?.length ?? 0,
              itemBuilder: ((context, index) {
                return _PostsCard(model: _items?[index]);
              })),
    );
  }
}

class _PostsCard extends StatelessWidget {
  const _PostsCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentsLearnView(postId: _model?.id)));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
