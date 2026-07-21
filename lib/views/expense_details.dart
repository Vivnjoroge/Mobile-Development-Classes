import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get.dart';

class ExpenseDetails extends StatelessWidget {
  final Map<String, dynamic> expense;

  const ExpenseDetails({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final String expenseName = expense['name']?.toString() ?? 'N/A';
    final String category = expense['category']?.toString() ?? 'N/A';
    final String date = expense['date']?.toString() ?? 'N/A';
    final String paymentMethod =
        expense['paymentMethod']?.toString() ?? 'N/A';
    final String notes = expense['notes']?.toString() ?? 'No notes added';

    final dynamic iconValue = expense['icon'];
    final IconData categoryIcon =
        iconValue is IconData ? iconValue : Icons.receipt_long;

    final double amount = (expense['amount'] is num)
        ? (expense['amount'] as num).toDouble()
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Details'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  categoryIcon,
                  size: 50,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.title),
                      title: const Text('Expense Name'),
                      subtitle: Text(expenseName),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: const Text('Amount'),
                      subtitle: Text('\$${amount.toStringAsFixed(2)}'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: const Text('Category'),
                      subtitle: Text(category),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: const Text('Date'),
                      subtitle: Text(date),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.payment),
                      title: const Text('Payment Method'),
                      subtitle: Text(paymentMethod),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.note),
                      title: const Text('Notes'),
                      subtitle: Text(notes),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Edit tapped')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Edit'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Delete'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}