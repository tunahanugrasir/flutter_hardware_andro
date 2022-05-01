import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_hardware_andro/demos/demo_json/model/demo_model.dart';
import 'package:flutter_hardware_andro/demos/demo_json/model/leage_model.dart';

abstract class IDemoService {
  IDemoService(this.dio);
  final Dio dio;
  Future<FootballModel?> fetchDemoItems();
  Future<LeagueModel?> fetchLeaugeDetailItems(String leagueIndex);
}

class DemoService extends IDemoService {
  DemoService(Dio dio) : super(dio);

  @override
  Future<FootballModel?> fetchDemoItems() async {
    final response = await dio.get('https://api-football-standings.azharimm.site/leagues/');
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is Map<String, dynamic>) {
        return FootballModel.fromJson(datas);
      }
    }
    return null;
  }

  @override
  Future<LeagueModel?> fetchLeaugeDetailItems(String leagueIndex) async {
    final response = await dio.get('https://api-football-standings.azharimm.site/leagues/',
        queryParameters: {_QueryParameters.id.name: leagueIndex});
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is Map<String, dynamic>) {
        return LeagueModel.fromJson(datas);
      }
    }
    return null;
  }
}

enum _QueryParameters { id }
