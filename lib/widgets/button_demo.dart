import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {

    void showSnackBar(){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Buttom Clicked'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: showSnackBar,
                child: Text('Elevated Buttom'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shadowColor: Colors.black,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
            ElevatedButton(
                onPressed: showSnackBar,
                child: Text('Elevated Disable'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  )
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                onPressed: showSnackBar,
                child: Text('Outlined Buttom'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(10, 30),
                  foregroundColor: Colors.green,
                  side: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),
              ),
            ),
            OutlinedButton(onPressed: null, child: Text('Outlined Disable')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: showSnackBar, child: Text('Text Buttom')),
            TextButton(onPressed: null, child: Text('Text Disable')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: showSnackBar, icon: Icon(Icons.ads_click)),
            IconButton(onPressed: null, icon: Icon(Icons.ads_click)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: showSnackBar,
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )
            ),
            FloatingActionButton(
                onPressed: showSnackBar,
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: showSnackBar,
              child: Container(
                width: 200,
                height: 50,
                child: Card(
                  color: Colors.green,
                  child: Center(
                      child: Text(
                        'Gesture Detector',
                        style: TextStyle(color: Colors.white),
                      )
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
