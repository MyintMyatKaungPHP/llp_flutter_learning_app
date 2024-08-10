import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> colors = [
      'red', 'green', 'blue', 'yellow', 'orange', 'red', 'green', 'blue', 'yellow', 'orange'
    ];

    Map<String,Color> map = {
      'red' : Colors.red,
      'green' : Colors.green,
      'blue' : Colors.blue,
      'yellow' : Colors.yellow,
      'orange' : Colors.orange,
    };

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 10,
        runSpacing: 20,
        children: colors.map((c) => Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
          backgroundColor: Colors.greenAccent,
          label: Text(c),
          avatar: CircleAvatar(
            backgroundColor: map[c],
            child: Text(c[0]),
          ),
        )).toList(),
      ),
    );
  }
}
