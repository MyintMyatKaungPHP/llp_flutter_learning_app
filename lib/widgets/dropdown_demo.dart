import 'package:flutter/material.dart';

class DropdownDemo extends StatefulWidget {
  const DropdownDemo({super.key});

  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}

class _DropdownDemoState extends State<DropdownDemo> {
  List<String> colors = [
    'red',
    'green',
    'blue',
  ];
  String? selectedColor;


  List<String> options = ['setting','profile','update'];
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Dropdown Buttom'),
            trailing: DropdownButton<String>(
              value: selectedColor,
              hint: Text('Choose color'),
              underline: SizedBox(),
              dropdownColor: Colors.deepPurple,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              items: colors.map((color){
                return DropdownMenuItem(value: color,child: Text(color));
              }).toList(),
              onChanged: (String? value){
                setState(() {
                  selectedColor = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Popup Button'),
            trailing: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (String? value){
                setState(() {
                  selectedOption = value;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(selectedOption!)),
                  );
                });
              },
              itemBuilder: (BuildContext context){
                return options.map((option){
                  return PopupMenuItem(child: Text(option),value: option,);
                }).toList();
              },
            ),
          )
        ],
      ),
    );
  }
}
