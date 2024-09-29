import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  Future<void> getExpenseFuture() async {
    return Provider.of<ExpenseProvider>(context, listen: false)
        .fetchAllExpenses();
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
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<ExpenseProvider>(
              builder: (context, provider, _) {
                return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: false,
                    title: Text('Total Expenses'),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          '${provider.getTotal} MMK',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: provider.getAllExpenses.isEmpty
                        ? Center(
                            child: Text('No expense data. Add expense!'),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title:
                                      Text(provider.getAllExpenses[index].name),
                                  subtitle:
                                      Text(provider.getAllExpenses[index].date),
                                  trailing: OverflowBar(children: [
                                    Text(
                                        '${provider.getAllExpenses[index].amount} MMK'),
                                    IconButton(
                                        onPressed: () {
                                          showActionDialog(context,
                                              expense: provider
                                                  .getAllExpenses[index]);
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 16,
                                        )),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Icon(
                                                    Icons.info,
                                                    size: 36,
                                                    color: Colors.blue,
                                                  ),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Are you sure to delete?'),
                                                      OverflowBar(
                                                        alignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context),
                                                              child:
                                                                  Text('No')),
                                                          TextButton(
                                                              onPressed: () {
                                                                provider.deleteExpense(
                                                                    provider
                                                                        .getAllExpenses[
                                                                            index]
                                                                        .id);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child:
                                                                  Text('Yes')),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ));
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 16,
                                      ),
                                      color: Colors.red,
                                    ),
                                  ]),
                                ),
                              );
                            },
                            separatorBuilder: (_, __) => SizedBox(
                                  height: 8,
                                ),
                            itemCount: provider.getAllExpenses.length),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      showActionDialog(context);

                      // provider.addExpense(
                      //   Expense(id: '1001', name: 'Breakfast', amount: 3000, date: '2024-9-8'),
                      // );
                    },
                    child: Icon(Icons.add),
                  ),
                );
              },
            );
          }
        });
  }

  final nameController = TextEditingController();
  final amountController = TextEditingController();

  void showActionDialog(BuildContext context, {Expense? expense}) {
    final provider = Provider.of<ExpenseProvider>(context, listen: false);
    if (expense != null) {
      nameController.text = expense.name;
      amountController.text = expense.amount.toString();
    }else{
      nameController.clear();
      amountController.clear();
    }
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          expense == null ? 'Add New Expense' : 'Update Expense',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.close)),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Text('Name'), border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text('Amount'), border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                          onPressed: () {
                            if (expense != null) {
                              provider.updateExpense(Expense(
                                  id: expense.id,
                                  name: nameController.text,
                                  amount: int.parse(amountController.text),
                                  date: expense.date));
                            } else {
                              DateTime today = DateTime.now();
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(today);
                              provider.addExpense(Expense(
                                  id: '0',
                                  name: nameController.text,
                                  amount: int.parse(amountController.text),
                                  date: formattedDate));
                            }
                            nameController.clear();
                            amountController.clear();
                            Navigator.pop(context);
                          },
                          child: Text(expense == null ? 'Save' : 'Update')),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
