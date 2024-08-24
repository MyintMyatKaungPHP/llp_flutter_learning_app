import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';

class HidableBottomAppbarDemo extends StatefulWidget {
  const HidableBottomAppbarDemo({super.key});

  @override
  State<HidableBottomAppbarDemo> createState() => _HidableBottomAppbarDemoState();
}

class _HidableBottomAppbarDemoState extends State<HidableBottomAppbarDemo> {
  int currentIndex = 0;
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        controller: scrollController,
          itemBuilder: (context, index){
            return Container(height: 80, color: Colors.primaries[index%Colors.primaries.length],);
          },
          separatorBuilder: (context,index) => SizedBox(height: 10,),
          itemCount: 50
      ),
      bottomNavigationBar: Hidable(
          child: BottomNavigationBar(
            
            type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.green,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add'),
                BottomNavigationBarItem(icon: Icon(Icons.map),label: 'Map'),
                BottomNavigationBarItem(icon: Icon(Icons.map),label: 'Map'),
              ],
            currentIndex: currentIndex,
            onTap: (int newIndex){
                setState(() {
                  currentIndex = newIndex;
                });
            },
          ),
          preferredWidgetSize: Size.fromHeight(100),
          enableOpacityAnimation: true,
          controller: scrollController,
      ),
    );
  }
}
