import 'package:flutter/material.dart';

class OtherStatefulWidgets extends StatefulWidget {
  const OtherStatefulWidgets({super.key});

  @override
  State<OtherStatefulWidgets> createState() => _OtherStatefulWidgetsState();
}

class _OtherStatefulWidgetsState extends State<OtherStatefulWidgets> {
  bool on = false;
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Switch'),
            trailing: Switch(
              value: on,
              onChanged: (bool value){
                setState(() {
                  on = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
