import 'package:flutter/material.dart';

class OpacityDemo extends StatefulWidget {
  const OpacityDemo({super.key});

  @override
  State<OpacityDemo> createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  double opacity_red = 1;
  double opacity_green = 1;
  double opacity_blue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              opacity_red = 1 - opacity_red;
            });
          },
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: opacity_red,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(height: 10,),
        GestureDetector(
          onTap: (){
            setState(() {
              opacity_green = 1 - opacity_green;
            });
          },
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: opacity_green,
            curve: Curves.bounceIn,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        ),
        SizedBox(height: 10,),
        GestureDetector(
          onTap: (){
            setState(() {
              opacity_blue = 1 - opacity_blue;
            });
          },
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: opacity_blue,
            curve: Curves.fastOutSlowIn,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
