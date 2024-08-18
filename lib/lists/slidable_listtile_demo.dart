import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListtileDemo extends StatefulWidget {
  const SlidableListtileDemo({super.key});

  @override
  State<SlidableListtileDemo> createState() => _SlidableListtileDemoState();
}

class _SlidableListtileDemoState extends State<SlidableListtileDemo> {

  final List<String> items = List.generate(10, (index) => "Item ${index}");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
        itemBuilder: (context, index){
          return Slidable(
              key: ValueKey(index),

            startActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              // dismissible: DismissiblePane(onDismissed: () {}),

              // All actions are defined in the children parameter.
              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (_){
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                 SlidableAction(
                  onPressed: (_){},
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
              ],
            ),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_){
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.thumb_up,
                  label: 'Like',
                ),
              ],
            ),

              child: ListTile(
                title: Text(items[index]),
              ),
          );
        }
    );
  }
}
