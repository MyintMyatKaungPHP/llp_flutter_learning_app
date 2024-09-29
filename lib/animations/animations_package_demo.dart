import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimationsPackageDemo extends StatelessWidget {
  const AnimationsPackageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OpenContainer(closedBuilder: (context, action) {
          return ListTile(
            title: Text('Close Builder'),
            subtitle: Text('Click to see animation container'),
          );
        }, openBuilder: (context, action) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Open Builder'),
            ),
            body: Center(
              child: Text('New Page'),
            ),
          );
        }),
        ListTile(
          title: Text('Page Transition Switcher'),
        ),
        SizedBox(
          height: 300,
          child: PageTransitionSwitcherDemo(),
        ),
        ListTile(
          title: Text('Shared Axis Transition'),
        ),
        SizedBox(
          height: 300,
          child: ShareAxisTransitionDemo(),
        ),

        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class ShareAxisTransitionDemo extends StatefulWidget {
  const ShareAxisTransitionDemo({super.key});

  @override
  State<ShareAxisTransitionDemo> createState() =>
      _ShareAxisTransitionDemoState();
}

class _ShareAxisTransitionDemoState extends State<ShareAxisTransitionDemo> {
  int currentIndex = 0;
  final icons = [
    Icon(
      Icons.home,
      key: ValueKey('home'),
    ),
    Icon(
      Icons.account_circle,
      key: ValueKey('profile'),
    ),
    Icon(
      Icons.settings,
      key: ValueKey('setting'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: PageTransitionSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder: (child, primaryAnimation, secondaryAnimation){
                  return SharedAxisTransition(
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.vertical,
                      child: child,
                  );
                },
              child: icons[currentIndex],
            )),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: currentIndex == 0 ? null : ()=> setState(()=>currentIndex--),
                    child: Text('Back')
                ),
                TextButton(
                    onPressed: currentIndex == 2 ? null : ()=> setState(()=>currentIndex++),
                    child: Text('Next')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PageTransitionSwitcherDemo extends StatefulWidget {
  const PageTransitionSwitcherDemo({super.key});

  @override
  State<PageTransitionSwitcherDemo> createState() =>
      _PageTransitionSwitcherDemoState();
}

class _PageTransitionSwitcherDemoState
    extends State<PageTransitionSwitcherDemo> {
  final icons = [
    Icon(
      Icons.home,
      key: ValueKey('home'),
    ),
    Icon(
      Icons.account_circle,
      key: ValueKey('profile'),
    ),
  ];
  final btnNavbarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageTransitionSwitcher(
          duration:
              Duration(seconds: 1), // Reduced duration for better visualization
          reverse: false, // Ensure it transitions forward
          transitionBuilder: (Widget child, Animation<double> primaryAnimation,
              Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: icons[currentIndex], // Ensure child changes with unique keys
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: btnNavbarItems,
        currentIndex: currentIndex,
        onTap: (newIndex) => setState(() {
          currentIndex = newIndex;
        }),
      ),
    );
  }
}
