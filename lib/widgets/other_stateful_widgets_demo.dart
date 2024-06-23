import 'dart:ui';

import 'package:flutter/material.dart';

class OtherStatefulWidgets extends StatefulWidget {
  const OtherStatefulWidgets({super.key});

  @override
  State<OtherStatefulWidgets> createState() => _OtherStatefulWidgetsState();
}

class _OtherStatefulWidgetsState extends State<OtherStatefulWidgets> {
  bool on = false;
  bool checked = false;
  double s1 = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Switch'),
            trailing: Switch(
              activeColor: Colors.deepPurpleAccent,
              value: on,
              onChanged: (bool value){
                setState(() {
                  on = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Checkbox'),
            trailing: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: checked,
                onChanged: (bool? value){
                  setState(() {
                    checked = value!;
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: Text('Slider: ${s1.round()}'),
            subtitle: SliderTheme(
              data: SliderThemeData(
                trackHeight: 10,
                thumbColor: Colors.purple,
                inactiveTrackColor: Colors.red,
                activeTrackColor: Colors.green
              ),
              child: Slider(
                max: 100,
                min: 0,
                label: '${s1.round()}',
                divisions: 100,
                value: s1,
                onChanged: (double value){
                  setState(() {
                    s1 = value;
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: Text('Circular Progress Indicator'),
            trailing: CircularProgressIndicator(
              color: Colors.deepPurple,
              backgroundColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text('Linear Progress Indicator'),
            subtitle: LinearProgressIndicator(
              minHeight: 10,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.deepPurple,
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
