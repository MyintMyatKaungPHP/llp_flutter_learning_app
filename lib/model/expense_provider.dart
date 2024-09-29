import 'dart:convert';

import 'package:flutter/material.dart';
import 'expense.dart';
import 'package:http/http.dart' as http;

class ExpenseProvider with ChangeNotifier {
  final String _dbUrl =
      "https://llp-firebase-test-default-rtdb.asia-southeast1.firebasedatabase.app/";

  List<Expense> expense_list = [];


  // Server က data များကို ခေါ်ယူသည်။
  Future<void> fetchAllExpenses() async {
    if (expense_list.isNotEmpty) return;
    final response = await http.get(Uri.parse('$_dbUrl/expense.json'));
    final result = jsonDecode(response.body);
    result.forEach((id, json) {
      expense_list.add(Expense.fromJson(id, json));
    });
  }

  // Total expense ပေါင်းခြင်း
  int get getTotal{
    int sum = 0;
    for(Expense expense in expense_list){
      sum += expense.amount;
    }
    return sum;
  }

  // CRUD

  // Create
  Future<void> addExpense(Expense expense) async {
    final response = await http.post(Uri.parse('$_dbUrl/expense.json'),
        body: jsonEncode(expense.toJson()));
    expense.id = jsonDecode(response.body)['name'];

    expense_list.add(expense);
    notifyListeners();
  }

  // Read
  List<Expense> get getAllExpenses {
    return expense_list;
  }

  // Update
  void updateExpense(Expense newExpense) async {
    String id = newExpense.id;
    int index = expense_list.indexWhere((exp) => exp.id == id);

    await http.patch(Uri.parse('$_dbUrl/expense.json'),
        body: jsonEncode(newExpense.toJson()));

    expense_list[index] = newExpense;
    notifyListeners();
  }

  // Delete
  void deleteExpense(String id) async {
    await http.delete(Uri.parse('$_dbUrl/expense/$id.json'));
    int index = expense_list.indexWhere((exp) => exp.id == id);
    expense_list.removeAt(index);
    notifyListeners();
  }


}
