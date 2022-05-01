import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/leage_model.dart';
import '../service/demo_service.dart';
import '../view/league_detail_view.dart';

abstract class LeagueDetailViewModel extends State<LeagueDetailView> {
  late final IDemoService _demoService;

  List<LeagueData>? leagueData = [];

  @override
  void initState() {
    super.initState();
    _demoService = DemoService(Dio());
    fetchLeagueDetailsWithId(widget.id ?? '');
  }

  fetchLeagueDetailsWithId(String? index) async {
    leagueData = (await _demoService.fetchLeaugeDetailItems(index ?? ''))?.data ?? [];
  }
}
