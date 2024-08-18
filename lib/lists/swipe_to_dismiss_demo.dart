import 'package:flutter/material.dart';

class SwipeToDismissDemo extends StatefulWidget {
  const SwipeToDismissDemo({super.key});

  @override
  State<SwipeToDismissDemo> createState() => _SwipeToDismissDemoState();
}

class _SwipeToDismissDemoState extends State<SwipeToDismissDemo> {
  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return Dismissible(
              key: ValueKey(index),
              child: ListTile(
                title: Text(items[index],
                ),
              ),
            onDismissed: (direction){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(direction == DismissDirection.startToEnd ? 'Deleted' : 'Liked'))
                );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.delete,),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: Icon(Icons.thumb_up),
            ),
          );
        }
    );
  }
}

