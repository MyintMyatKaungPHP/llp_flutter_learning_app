import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('Image from network'),
          Image.network(
              'https://cdn.iconscout.com/icon/free/png-512/free-flutter-2038877-1720090.png?f=webp&w=256',
              loadingBuilder: (context,child,prgress){
                return prgress == null ? child : CircularProgressIndicator();
              },
              errorBuilder: (context,_,event){
                return Icon(Icons.error);
              },
          ),
          Text('Image from assets'),
          Card(
            elevation: 20,
            shadowColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.asset('assets/images/miea.png')
            ),
          ),
        ],
      ),
    );
  }
}
