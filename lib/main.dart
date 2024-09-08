import 'package:flutter/material.dart';
import 'package:llp_flutter_learning_app/async/ab_provider.dart';
import 'package:llp_flutter_learning_app/homescreen.dart';
import 'package:llp_flutter_learning_app/model/expense_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExpenseProvider()),
        ChangeNotifierProvider(create: (context) => ABProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
          )
        ),
        home: HomeScreen(),
      ),
    );
  }
}
