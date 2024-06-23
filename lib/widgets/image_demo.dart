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
              'https://img.freepik.com/free-vector/watercolor-chinese-style-background_52683-96103.jpg?w=1380&t=st=1719136295~exp=1719136895~hmac=74ea22201e6a8bf716809b795662b803c2d1169a43790d88127bb8541502f7c2',
              loadingBuilder: (context,child,progress){
                return progress == null ? child : CircularProgressIndicator();
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
