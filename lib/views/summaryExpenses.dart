import 'package:flutter/material.dart';

class ExpenseSummary extends StatefulWidget {
  const ExpenseSummary({super.key});

  @override
  State<ExpenseSummary> createState() => _ExpenseSummaryState();
}

class _ExpenseSummaryState extends State<ExpenseSummary> {
  @override
  Widget build(BuildContext context) {
    return Text("Expense Summary");
  }
}