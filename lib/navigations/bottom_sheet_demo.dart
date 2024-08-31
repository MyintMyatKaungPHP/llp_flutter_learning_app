import 'package:flutter/material.dart';

class BottomSheetDemo extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Bottom Sheet Demo'),),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: (){
                  scaffoldKey.currentState!.showBottomSheet((content){
                    return Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.purple,
                      child: IconButton(
                          onPressed: ()=>Navigator.pop(content),
                          icon: Icon(Icons.close),color: Colors.white,),
                    );
                  });
                },
                child: Text('Show Bottom Sheet with Key')
            ),
            
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context)=>Container()
                  );
                },
                child: Text('Model Bottom Sheet')
            ),
          ],
        ),
      ),
    );
  }
}
