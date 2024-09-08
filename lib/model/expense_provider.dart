import 'dart:convert';

import 'package:flutter/material.dart';
import 'expense.dart';
import 'package:http/http.dart' as http;

class ExpenseProvider with ChangeNotifier {

  final String _dbUrl = "https://llp-firebase-test-default-rtdb.asia-southeast1.firebasedatabase.app/";



  List<Expense> expense_list = [];

  // CRUD

  // Create
  Future<void> addExpense(Expense expense) async{
    final response = await http.post(
        Uri.parse('$_dbUrl/expense.json'),
        body: jsonEncode(expense.toJson())
    );
    print(response);
    expense_list.add(expense);
    notifyListeners();
  }

  // Read
  List<Expense> get getAllExpenses{
    return expense_list;
  }

  // Update
  void updateExpense(Expense newExpense){
    String id = newExpense.id;
    int index = expense_list.indexWhere((exp)=>exp.id == id);

    expense_list[index]  = newExpense;
    notifyListeners();
  }

  // Delete
  void deleteExpense(String id){
    int index = expense_list.indexWhere((exp)=>exp.id == id);
    expense_list.removeAt(index);
    notifyListeners();
  }

  // Server ကလာတဲ့ data များကို ခေါ်ယူသည်။
  Future<void> fetchAllExpenses() async{
    await Future.delayed(Duration(seconds: 0));
    print('Data is ready');
  }

}