import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/demos/demo_json/model/demo_model.dart';
import 'package:flutter_hardware_andro/demos/demo_json/service/demo_service.dart';

import '../view/demo_view.dart';

abstract class DemoViewModel extends State<DemoView> {
  late final IDemoService _demoService;
  List<Data> demoResources = [];
  @override
  void initState() {
    super.initState();
    _demoService = DemoService(Dio());
    _fetchDemoItems();
  }

  Future<void> _fetchDemoItems() async {
    demoResources = (await _demoService.fetchDemoItems())?.data ?? [];
  }

  
}
