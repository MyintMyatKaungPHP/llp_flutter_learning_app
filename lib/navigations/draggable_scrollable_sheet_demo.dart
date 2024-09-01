import 'package:flutter/material.dart';

class DraggableScrollableSheetDemo extends StatelessWidget {
  const DraggableScrollableSheetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drag & Scroll Sheet')),
      body: Stack(
        children: [
          Container(color: Colors.white),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    // Bar icon (drag handle)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // Scrollable list inside the sheet
                    Expanded(
                      child: Scrollbar(
                        controller: scrollController,
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(Icons.account_circle, color: Colors.white),
                              title: Text(
                                'Item ${index + 1}',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}