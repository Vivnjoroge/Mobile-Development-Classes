import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class ExpenseSummary extends StatelessWidget {
  const ExpenseSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final double totalIncome = 2500.00;
    final double totalExpenses = 780.00;
    final double balance = totalIncome - totalExpenses;

    final Map<String, double> spendingByCategory = {
      'Food': 250.0,
      'Transport': 120.0,
      'Shopping': 180.0,
      'Entertainment': 80.0,
    };

    final String highestCategory = 'Food';
    final String lowestCategory = 'Entertainment';
    final int totalTransactions = 18;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Expanded(
                child: _summaryCard(
                  title: 'Total Income',
                  value: '\$${totalIncome.toStringAsFixed(2)}',
                  color: Colors.green,
                  icon: Icons.arrow_downward,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _summaryCard(
                  title: 'Total Expenses',
                  value: '\$${totalExpenses.toStringAsFixed(2)}',
                  color: Colors.red,
                  icon: Icons.arrow_upward,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _summaryCard(
                  title: 'Balance',
                  value: '\$${balance.toStringAsFixed(2)}',
                  color: Colors.blue,
                  icon: Icons.account_balance_wallet,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Spending Breakdown',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: spendingByCategory.entries.map((entry) {
                  final double progress = entry.value / 300.0;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 12,
                            color: Colors.grey.shade300,
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: progress.clamp(0.0, 1.0),
                              child: Container(
                                color: _categoryColor(entry.key),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '\$${entry.value.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 2,
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.trending_up, color: Colors.green),
                  title: const Text('Highest Spending Category'),
                  subtitle: Text(highestCategory),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.trending_down, color: Colors.orange),
                  title: const Text('Lowest Spending Category'),
                  subtitle: Text(lowestCategory),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.receipt_long, color: Colors.blue),
                  title: const Text('Total Transactions'),
                  subtitle: Text('$totalTransactions'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryCard({
    required String title,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _categoryColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.orange;
      case 'Transport':
        return Colors.blue;
      case 'Shopping':
        return Colors.pink;
      case 'Entertainment':
        return Colors.purple;
      default:
        return primaryColor;
    }
  }
}