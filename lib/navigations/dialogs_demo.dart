import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DialogsDemo extends StatefulWidget {
  const DialogsDemo({super.key});

  @override
  State<DialogsDemo> createState() => _DialogsDemoState();
}

class _DialogsDemoState extends State<DialogsDemo> {
  @override
  Widget build(BuildContext context) {
    // Widget buildActionButton(String title,Color color, final action){
    //   return Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: ElevatedButton(
    //         style: ElevatedButton.styleFrom(
    //             backgroundColor: color,
    //             minimumSize: const Size(double.infinity, 60)
    //         ),
    //         onPressed: ()=> action,
    //         child: Text(title)
    //     ),
    //   );
    // }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60)
              ),
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Alert'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Are you sure to delete this?'),
                          OverflowBar(
                            children: [
                              TextButton(onPressed: ()=> Navigator.pop(context),child: const Text('No')),
                              TextButton(onPressed: ()=> Navigator.pop(context),child: const Text('Yes')),
                            ],
                          )
                        ],
                      ),
                    )
                );
              },
              child: const Text('Alert Dialog')
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60)
              ),
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      title: Text('Your Accounts'),
                      children: [
                        ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text('user1@gmail.com'),
                          onTap: ()=> Navigator.pop(context),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text('user2@gmail.com'),
                          onTap: ()=> Navigator.pop(context),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text('user3@gmail.com'),
                          onTap: ()=> Navigator.pop(context),
                        ),
                      ],
                    )
                );
              },
              child: const Text('Simple Dialog')
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60)
              ),
              onPressed: () async {
                final DateTime now = DateTime.now();
                TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                        hour: now.hour,
                        minute: now.minute,
                    )
                );
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(selectedTime!.format(context)))
                  );
                });
                // showTimePicker(
                //     context: context,
                //     initialTime: TimeOfDay(
                //       hour: now.hour,
                //       minute: now.minute,
                //     )
                // ).then((TimeOfDay? selectedTime){
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text(selectedTime!.format(context)))
                //   );
                // });


              },
              child: const Text('Time Picker Dialog')
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60)
              ),
              onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025)
                  );
                  // flutter pub add intl
                  String formatDate = DateFormat.yMMMd().format(selectedDate!);
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(formatDate))
                    );
                  });
              },
              child: const Text('Date Picker Dialog')
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60)
              ),
              onPressed: () {
                showDateRangePicker(
                    context: context, 
                    firstDate: DateTime(2024), 
                    lastDate: DateTime(2025)
                ).then((DateTimeRange? range){
                  String startDate = DateFormat.yMMMd().format(range!.start);
                  String endDate = DateFormat.yMMMd().format(range.end);
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$startDate - $endDate'))
                    );
                  });
                });
              },
              child: const Text('Date Range Picker Dialog')
          ),
        ],
      ),
    );
  }
}