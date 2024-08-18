import 'package:flutter/material.dart';

class GridviewBuilderDemo extends StatelessWidget {
  const GridviewBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          maxCrossAxisExtent: 100,
        ),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text('Item ${index + 1} is clicked',),
                  )
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 1),
                  // borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              // child: Text(
              //   'Item ${index+1}',
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
              child: Image.asset('assets/images/city.jpg',fit: BoxFit.cover),
            ),
          );
        },
        itemCount: 20,
    );
  }
}
