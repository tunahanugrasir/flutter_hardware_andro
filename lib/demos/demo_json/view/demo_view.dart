import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/demos/demo_json/view_model/demo_view_model.dart';

import 'league_detail_view.dart';

class DemoView extends StatefulWidget {
  final int? leagueId;
  const DemoView({Key? key, this.leagueId}) : super(key: key);

  @override
  State<DemoView> createState() => _DemoViewState();
}

class _DemoViewState extends DemoViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: demoResources.length,
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text(demoResources[index].name ?? ''),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => LeagueDetailView(id: demoResources[index].id))));
              },
            );
          })),
    );
  }
}
