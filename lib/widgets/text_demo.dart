import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 200,
        color: Colors.greenAccent,
        alignment: Alignment.center,
        child: Text(
          'Flutter is an open-source UI software development kit created by Google.',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 5,
            decoration: TextDecoration.underline,
            color: Colors.red,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center, // overflow သုံးရင် အသုံးမ၀င်ပါ
        ),
      ),
    );
  }
}
