import 'package:flutter/material.dart';

class SliverAppbarDemo extends StatelessWidget {
  const SliverAppbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('New York City',style: TextStyle(color: Colors.white),),
              background: Image.asset('assets/images/city.jpg', fit: BoxFit.fill,),
            ),
          ),
          SliverFillRemaining(
            child: Center(child: Text('Body Part ...'),),
          )
        ],
      ),
    );
  }
}
