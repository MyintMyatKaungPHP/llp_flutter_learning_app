import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {

  final random = Random();
  double width = 100, height = 100, radius = 8;
  Color color = Colors.green;
  Color txt_color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            Text('Width: ${width} Height: ${height} Radius: ${radius}', style: TextStyle(color: txt_color),)
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: (){
            setState(() {
              width = random.nextInt(1000).toDouble();
              height = random.nextInt(1000).toDouble();
              radius = random.nextInt(500).toDouble();
              color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
              txt_color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
            });
          }
      ),
    );
  }
}
