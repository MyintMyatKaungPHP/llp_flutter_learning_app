import 'package:flutter/material.dart';

class BottomNavbarDemo extends StatefulWidget {
  const BottomNavbarDemo({super.key});

  @override
  State<BottomNavbarDemo> createState() => _BottomNavbarDemoState();
}

class _BottomNavbarDemoState extends State<BottomNavbarDemo> {

  int currentIndex = 0;
  List<Widget> screens = [
    Center(child: Icon(Icons.home),),
    Center(child: Icon(Icons.message),),
    Center(child: Icon(Icons.notifications),),
    Center(child: Icon(Icons.account_circle),),
    Center(child: Icon(Icons.settings),),
  ];

  List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notifications'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
  ];

  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar bottomNavBar = BottomNavigationBar(
      items: navBarItems,
      currentIndex: currentIndex,
      selectedItemColor: Colors.green,
      type: BottomNavigationBarType.fixed,
      onTap: ((newIndex){
        setState(() {
          currentIndex = newIndex;
        });
      }),
    );



    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
