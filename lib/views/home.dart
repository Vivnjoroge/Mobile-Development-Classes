import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/dashboard.dart';
import 'package:flutter_application_1/views/add_expenses.dart';
import 'package:flutter_application_1/views/expense_details.dart';
import 'package:flutter_application_1/views/home.dart' as body;
import 'package:flutter_application_1/views/expense_summary.dart';

var screens = [Dashboard(), AddExpense(), ExpenseDetails(expense: {},), ExpenseSummary()];
int position = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.search, size: 30),
        ],
        onTap: (index) {
          setState(() {
            position = index;
          });

          //Handle button tap
        },
      ),
      body: body.screens[position],
    );
  }
}
