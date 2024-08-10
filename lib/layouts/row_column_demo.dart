import 'package:flutter/material.dart';

class RowColumnDemo extends StatefulWidget {
  const RowColumnDemo({super.key});

  @override
  State<RowColumnDemo> createState() => _RowColumnDemoState();
}

class _RowColumnDemoState extends State<RowColumnDemo> {

  List<Widget> items = [
    Icon(Icons.star, size: 64,color: Colors.yellow,),
    Icon(Icons.star, size: 128, color: Colors.white,),
    Icon(Icons.star, size: 64, color: Colors.black,),
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: items,
          ),
        ),
      ],
    );
  }
}
