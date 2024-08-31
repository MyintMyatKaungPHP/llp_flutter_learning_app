import 'package:flutter/material.dart';

class TabsDemo extends StatelessWidget {
  const TabsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Center(
        child: Icon(Icons.home),
      ),
      Center(
        child: Icon(Icons.dashboard),
      ),
      Center(
        child: Icon(Icons.person),
      ),
      Center(
        child: Icon(Icons.add),
      ),
    ];

    final List<Tab> tabs = [
      Tab(icon: Icon(Icons.home), text: 'Home',),
      Tab(icon: Icon(Icons.dashboard), text: 'Dashboard',),
      Tab(icon: Icon(Icons.person), text: 'Profile',),
      Tab(icon: Icon(Icons.add), text: 'Add',),
    ];

    return DefaultTabController(
        length: tabs.length, 
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tab Appbar'),
            bottom: TabBar(
              tabs: tabs,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.deepPurple,
              labelColor: Colors.white,
            ),
          ),
          body: TabBarView(children: screens),
        )
    );
  }
}
