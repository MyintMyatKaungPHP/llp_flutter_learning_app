import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

class BackdropDemo extends StatelessWidget {
  const BackdropDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        appBar: BackdropAppBar(
          title: Text('Backdrop Appbar'),
        ),
        headerHeight: 300,
        backLayerBackgroundColor: Colors.green,
        backLayer: Center(
          child: Text('Back Layer'),
        ),
        frontLayer: Center(
          child: Text('Front Layer'),
        )
    );
  }
}
