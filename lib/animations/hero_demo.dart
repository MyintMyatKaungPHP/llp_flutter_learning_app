import 'package:flutter/material.dart';

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('Preview Image'),
              ),
              body: Center(
                child: Hero(
                  tag: 'hero',
                    child: Image.asset('assets/images/miea.png'),
                ),
              ),
            ))
          );
        },
        child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/miea.png'),
          ),
        ),
      ),
      title: Text('Hero Animation'),
    );
  }
}
