import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/101/list_view_learn.dart';
import 'package:flutter_hardware_andro/202/services/post_model.dart';
import 'package:flutter_hardware_andro/202/services/post_service.dart';

import '../demos/list_view_builder_demo.dart';

class TabAdvanceLearn extends StatefulWidget {
  const TabAdvanceLearn({Key? key}) : super(key: key);

  @override
  State<TabAdvanceLearn> createState  () => _TabAdvanceLearnState();
}

class _TabAdvanceLearnState extends State<TabAdvanceLearn> with TickerProviderStateMixin {
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
        FeedView(),
      ],
    );
  }
}

enum _MyTabViews { home, sohbet, future }

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> with AutomaticKeepAliveClientMixin {
  final IPostService _postService = PostService();
  late final Future<List<PostModel>?> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = _postService.fetchPostItemsAdvance();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(
          future: _itemsFuture,
          builder: ((context, AsyncSnapshot<List<PostModel>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Placeholder();
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(snapshot.data?[index].title ?? ''),
                            subtitle: Text(snapshot.data?[index].body ?? ''),
                          ),
                        );
                      });
                } else {
                  return const Placeholder();
                }
            }
          })),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
