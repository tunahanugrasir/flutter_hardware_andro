import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/101/list_view_learn.dart';

import '../demos/list_view_builder_demo.dart';

class TabBarLearn extends StatefulWidget {
  const TabBarLearn({Key? key}) : super(key: key);

  @override
  State<TabBarLearn> createState() => _TabBarLearnState();
}

class _TabBarLearnState extends State<TabBarLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
          extendBody: true,
          // appBar: AppBar(
          //   backgroundColor: Colors.grey[850],
          //   bottom: const TabBar(tabs: [
          //     Tab(text: 'Sohbet'),
          //     Tab(text: 'Durum'),
          //   ]),
          // ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                _tabController.animateTo(_MyTabViews.home.index);
              },
              backgroundColor: const Color.fromARGB(255, 5, 162, 10),
              child: const Icon(Icons.home_outlined)),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(notchMargin: _notchedValue, child: _myTabBar()),
          body: _MyTabBarView(tabController: _tabController)),
    );
  }

  TabBar _myTabBar() {
    return TabBar(
        indicatorColor: Colors.white,
        padding: EdgeInsets.zero,
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: e.name,
                ))
            .toList());
  }
}

class _MyTabBarView extends StatelessWidget {
  const _MyTabBarView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: const [
        MyCollections(),
        ListViewLearn(),
      ],
    );
  }
}

enum _MyTabViews { home, sohbet }
