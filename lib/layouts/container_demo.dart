import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Hello',style: TextStyle(color: Colors.white, fontSize: 20),),
        alignment: Alignment.center,
        width: 200,
        height: 200,
        // color: Colors.green,
        transform: Matrix4.rotationZ(-0.1),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 5,color: Colors.purple),
        ),
      ),
    );
  }
}
