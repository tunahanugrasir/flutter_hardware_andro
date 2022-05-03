import 'package:flutter/material.dart';
import '../view_model/league_detail_view_model.dart';

class LeagueDetailView extends StatefulWidget {
  const LeagueDetailView({Key? key, this.id}) : super(key: key);
  final String? id;
  @override
  State<LeagueDetailView> createState() => _LeagueDetailViewState();
}

class _LeagueDetailViewState extends LeagueDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: leagueData?.length,
            itemBuilder: ((context, index) {
              return Card(
                child: Text(leagueData?[index].slug ?? ''),
              );
            })));
  }
}
