import 'package:flutter/material.dart';
import 'package:llp_flutter_learning_app/model/phone.dart';

Widget buildPhoneCard(Phone p){
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        child: Text('${p.quantity}'),
      ),
      title: Text(p.model),
      subtitle: Text(p.brand),
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
              onPressed: (){
                showSearch(
                    context: context,
                    delegate: MySearchDeligate(phones: phones)
                );
              },
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

class MySearchDeligate extends SearchDelegate{
  final List<Phone> phones;
  MySearchDeligate({required this.phones});

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        tooltip: 'Voice Search',
          onPressed: (){},
          icon: Icon(Icons.mic),
      ),
      if(query != '')
      IconButton(
        tooltip: 'Clear',
          onPressed: (){
            query = '';
          },
          icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Phone> filterResults = query.isEmpty ? phones : phones.where((p)=>p.model.contains(query) || p.brand.contains(query)).toList();
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemBuilder: (context,index) => buildPhoneCard(filterResults[index]),
      separatorBuilder: (context,index) => SizedBox(height: 5,),
      itemCount: filterResults.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Phone> filterResults = query.isEmpty ? phones : phones.where((p)=>p.model.contains(query) || p.brand.contains(query)).toList();
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemBuilder: (context,index) => buildPhoneCard(filterResults[index]),
      separatorBuilder: (context,index) => SizedBox(height: 5,),
      itemCount: filterResults.length,
    );
  }

}
