import 'package:flutter/material.dart';
import 'package:llp_flutter_learning_app/homescreen.dart';

class PageSelectorDemo extends StatefulWidget {
  const PageSelectorDemo({super.key});

  @override
  State<PageSelectorDemo> createState() => _PageSelectorDemoState();
}

class _PageSelectorDemoState extends State<PageSelectorDemo> {
  String btnName = 'Next';

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      Icon(Icons.home),
      Icon(Icons.chat),
      Icon(Icons.account_circle),
      Icon(Icons.notifications),
      Icon(Icons.settings),
    ];

    return DefaultTabController(
      length: widgets.length,
      child: Builder(builder: (context) {
        final TabController tabController = DefaultTabController.of(context);

        // Listen for tab index changes to update the button name
        tabController.addListener(() {
          setState(() {
            if (tabController.index == widgets.length - 1) {
              btnName = 'Go to Home Screen';
            } else {
              btnName = 'Next';
            }
          });
        });

        return Column(
          children: [
            Expanded(
              child: IconTheme(
                data: IconThemeData(size: 128, color: Colors.green),
                child: TabBarView(children: widgets),
              ),
            ),
            TabPageSelector(),
            ElevatedButton(
              onPressed: () {
                if (tabController.index == widgets.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  tabController.animateTo(tabController.index + 1);
                }
              },
              child: Text(btnName),
            ),
            SizedBox(height: 40),
          ],
        );
      }),
    );
  }
}