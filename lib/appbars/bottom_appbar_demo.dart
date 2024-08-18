import 'package:flutter/material.dart';

class BottomAppbarDemo extends StatelessWidget {
  const BottomAppbarDemo({super.key});
  

  
  @override
  Widget build(BuildContext context) {
    void displayBottomSheet(){
      showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            height: 200,
            alignment: Alignment.center,
            child: Text('Bottom Sheet'),
          )
      );
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
          mini: false,
          child: Icon(Icons.add, color: Colors.white,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.green,
        child: Row(
          children: [
            IconButton(onPressed: displayBottomSheet, icon: Icon(Icons.menu,color: Colors.white,)),
            IconButton(onPressed: displayBottomSheet, icon: Icon(Icons.search,color: Colors.white,)),
            IconButton(onPressed: displayBottomSheet, icon: Icon(Icons.home,color: Colors.white,)),
          ],
        ),
      ),
    );
  }
}
