import 'package:flutter/material.dart';
import 'package:llp_flutter_learning_app/model/expense.dart';
import 'package:llp_flutter_learning_app/model/expense_provider.dart';
import 'package:provider/provider.dart';

class FutureBuilderDemo extends StatefulWidget {
  const FutureBuilderDemo({super.key});

  @override
  State<FutureBuilderDemo> createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {

  late Future expenseFuture;

  Future<void> getExpenseFuture() async{
    return Provider.of<ExpenseProvider>(context,listen: false).fetchAllExpenses();
  }

  @override
  void initState() {
    // TODO: implement initState
    expenseFuture = getExpenseFuture();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: expenseFuture,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Consumer<ExpenseProvider>(
              builder: (context,provider,_){
                return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: false,
                    title: Text('Total Expenses'),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text('0 MMK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      ),

                    ],
                  ),
                  body: Placeholder(),
                  floatingActionButton: FloatingActionButton(
                      onPressed: (){
                        provider.addExpense(
                          Expense(id: '1001', name: 'Breakfast', amount: 3000, date: '2024-9-8'),
                        );
                      },
                    child: Icon(Icons.add),
                  ),
                );
              },
            );
          }
        }
    );
  }
}
