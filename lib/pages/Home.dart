import 'package:flutter/material.dart';

import '../drawer/Drawer.dart';

import 'Unconcluded.dart';
import 'Concluded.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  static const List<Tab> tabs = <Tab>[
    Tab(
      icon: Icon(
        Icons.format_list_bulleted_outlined,
        size: 20.0,
      ),
      iconMargin: EdgeInsets.all(1.0),
      text: "Lista",
    ),
    Tab(
      icon: Icon(
        Icons.done,
        size: 20.0,
      ),
      iconMargin: EdgeInsets.all(1.0),
      text: "Concluídas",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TodoList',
          style: TextStyle(
            fontFamily: 'Arial',
          ),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: const Color(0xFF2E2E2E),
      ),
      drawer: DrawerComponent(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: Text(
                'Lista',
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                ),
              ),
              backgroundColor: const Color(0xFF34817C),
              elevation: 0,
            ),
            body: SafeArea(
              child: UnconcludedPage(),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text(
                'Concluídos',
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                ),
              ),
              backgroundColor: const Color(0xFF34817C),
            ),
            body: SafeArea(
              child: ConcludedPage(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          color: Color(0xFFC5C3C6),
          child: TabBar(
            unselectedLabelColor: Color(0xFF2E2E2E),
            labelColor: Color(0xFFFAFAFA),
            controller: _tabController,
            indicator: BoxDecoration(
              color: Color(0xFF34817C),
            ),
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}
