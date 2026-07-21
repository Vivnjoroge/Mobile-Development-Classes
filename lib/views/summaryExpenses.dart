import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class ExpenseSummary extends StatefulWidget {
  const ExpenseSummary({super.key});

  @override
  State<ExpenseSummary> createState() => _ExpenseSummaryState();
}

class _ExpenseSummaryState extends State<ExpenseSummary> {
  final Map<String, double> expensesByCategory = {
    'Food': 50.25,
    'Transport': 25.00,
    'Entertainment': 30.50,
    'Shopping': 89.75,
    'Utilities': 45.00,
  };

  final double totalIncome = 2500.00;
  final double totalExpenses = 240.50;

  @override
  Widget build(BuildContext context) {
    double remainingBalance = totalIncome - totalExpenses;
    String highestCategory = expensesByCategory.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
    double highestAmount = expensesByCategory.values.reduce((a, b) => a > b ? a : b);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Overview",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _overviewCard(
                  "Total Income",
                  "\$${totalIncome.toStringAsFixed(2)}",
                  Colors.green,
                ),
                _overviewCard(
                  "Total Expenses",
                  "\$${totalExpenses.toStringAsFixed(2)}",
                  Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _overviewCard(
              "Remaining Balance",
              "\$${remainingBalance.toStringAsFixed(2)}",
              Colors.blue,
            ),
            const SizedBox(height: 24),
            const Text(
              "Expenses by Category",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: expensesByCategory.length,
                itemBuilder: (context, index) {
                  String category = expensesByCategory.keys.toList()[index];
                  double amount = expensesByCategory[category]!;
                  double percentage = (amount / totalExpenses * 100);

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                category,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$${amount.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: percentage / 100,
                                    minHeight: 8,
                                    backgroundColor: Colors.grey[300],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      _getCategoryColor(category),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "${percentage.toStringAsFixed(1)}%",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: secondaryColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.trending_up,
                      color: Colors.amber,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Highest Spending Category",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "$highestCategory - \$${highestAmount.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _overviewCard(String title, String amount, Color color) {
    return Expanded(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    final colors = {
      'Food': Colors.orange,
      'Transport': Colors.blue,
      'Entertainment': Colors.purple,
      'Shopping': Colors.pink,
      'Utilities': Colors.teal,
    };
    return colors[category] ?? Colors.grey;
  }
}