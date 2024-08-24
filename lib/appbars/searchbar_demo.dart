import 'package:flutter/material.dart';
import 'package:llp_flutter_learning_app/model/phone.dart';

Widget buildPhoneCard(Phone p){
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        child: Text('${p.quantity}'),
      ),
      title: Text(p.brand),
      subtitle: Text(p.model),
      trailing: Text('\$ ${p.price}'),
    ),
  );
}

class SearchbarDemo extends StatefulWidget {
  const SearchbarDemo({super.key});

  @override
  State<SearchbarDemo> createState() => _SearchbarDemoState();
}

class _SearchbarDemoState extends State<SearchbarDemo> {
  @override
  Widget build(BuildContext context) {
    List<Phone> phones = phoneData();

    return Scaffold(
      appBar: AppBar(
        title: Text('M Mobile'),
        actions: [
          IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.search)
          )
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
          itemBuilder: (context,index) => buildPhoneCard(phones[index]),
          separatorBuilder: (context,index) => SizedBox(height: 5,),
          itemCount: phones.length,
      ),
    );
  }
}
