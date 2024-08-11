import 'package:flutter/material.dart';

class ListTileDemo extends StatelessWidget {
  const ListTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Badge(
            backgroundColor: Colors.green,
            label: Text(''),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/miea.png'),
            ),
          ),
          title: Text(
            'MIEA School',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            'International School'
          ),
          trailing: Icon(
            Icons.chat
          ),
        ),
        Divider(),
        ListTile(
          leading: Badge(
            backgroundColor: Colors.green,
            label: Text(''),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/miea.png'),
            ),
          ),
          title: Text(
            'MIEA School',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
              'International School'
          ),
          trailing: Icon(
              Icons.chat
          ),
        ),
        Divider(),
      ],
    );
  }
}
