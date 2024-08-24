import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class ConvexBottomBarDemo extends StatefulWidget {
  const ConvexBottomBarDemo({super.key});

  @override
  State<ConvexBottomBarDemo> createState() => _ConvexBottomBarDemoState();
}
int selectedIndex = 0;
class _ConvexBottomBarDemoState extends State<ConvexBottomBarDemo> {
  List<IconData> icons = [
    Icons.home,
    Icons.map,
    Icons.add,
    Icons.message,
    Icons.people,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Icon(icons[selectedIndex],size: 120,),
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          initialActiveIndex: 1,
          {3:'99+',0:'1'},
          style: TabStyle.react,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          onTap: (int i) => setState(() {
            selectedIndex = i;
          }),
        )
    );
  }
}
