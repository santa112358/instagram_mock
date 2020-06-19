import 'package:flutter/material.dart';
import 'package:instagram_mock/home_page/home_page.dart';
import 'package:instagram_mock/post_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  @override
  TabController _tabController;

  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          PostPage(),
        ],
      ),
    );
  }
}
