import 'package:flutter/material.dart';

class FractionallySizeboxDemo extends StatelessWidget {
  const FractionallySizeboxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
            child: FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: Container(
                color: Colors.orange,
                child: Placeholder(),
              ),
            )
        ),
        Container(
          height: 100,
          color: Colors.green,
        ),

      ],
    );
  }
}
