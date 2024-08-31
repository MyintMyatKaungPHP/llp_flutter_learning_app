import 'package:flutter/material.dart';

class BottomTabbarDemo extends StatefulWidget {
  const BottomTabbarDemo({super.key});

  @override
  State<BottomTabbarDemo> createState() => _BottomTabbarDemoState();
}

class _BottomTabbarDemoState extends State<BottomTabbarDemo> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState(){
    super.initState();
    tabController = TabController(
        length: 3,
        vsync: this
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: tabController,
          children: [
            Icon(Icons.home),
            Icon(Icons.account_circle),
            Icon(Icons.settings),
          ]
      ),
      bottomNavigationBar: Container(
        color: Colors.grey,
        child: TabBar(
            controller: tabController,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home',),
              Tab(icon: Icon(Icons.account_circle), text: 'Profile',),
              Tab(icon: Icon(Icons.settings), text: 'Setting',),
            ]
        ),
      ),
    );
  }
}
