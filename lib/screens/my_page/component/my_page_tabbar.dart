import 'package:flutter/material.dart';

class MyPageTabbar extends StatefulWidget {
  @override
  _MyPageTabbarState createState() => _MyPageTabbarState();
}

class _MyPageTabbarState extends State<MyPageTabbar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Tabbar(tabController: _tabController),
        Expanded(
          child: _TabBarView(tabController: _tabController),
        ),
      ],
    );
  }
}

class _TabBarView extends StatelessWidget {
  const _TabBarView({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              return Image.network(
                "https://picsum.photos/id/${index + 1}/500/500",
              );
            },
          ),
        ),
        Container(color: Colors.red),
      ],
    );
  }
}

class _Tabbar extends StatelessWidget {
  const _Tabbar({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
      tabs: const [
        Tab(text: "콘텐츠"), // 첫 번째 탭
        Tab(text: "스크랩"), // 두 번째 탭
      ],
    );
  }
}
