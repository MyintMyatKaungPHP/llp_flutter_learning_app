import 'package:flutter/material.dart';

class ReorderableListviewDemo extends StatefulWidget {
  const ReorderableListviewDemo({super.key});

  @override
  State<ReorderableListviewDemo> createState() => _ReorderableListviewDemoState();
}

class _ReorderableListviewDemoState extends State<ReorderableListviewDemo> {
  List<String> names = [
    'John Smith',
    'Emily Johnson',
    'Michael Brown',
    'Jessica Davis',
    'David Wilson',
    'Sarah Miller',
    'James Taylor',
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: EdgeInsets.all(10),
        children: names.map((String name){
          return Card(
            key: ValueKey(name),
            child: ListTile(
              title: Text(name),
              trailing: Icon(Icons.menu),
            ),
          );
        }).toList(),
      onReorder: (oldIndex, newIndex){
        setState(() {
          if(newIndex>oldIndex){
            newIndex -= 1;
          }
          final item = names.removeAt(oldIndex);
          names.insert(newIndex, item);
        });
      },
    );
  }
}
