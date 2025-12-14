import 'package:flutter/material.dart';

class Expenses {
  final String title;
  final double amount;
  Expenses({required this.title, required this.amount});
}

class ExpensesTracker extends StatefulWidget {
  const ExpensesTracker({super.key});

  @override
  State<ExpensesTracker> createState() => _ExpensesTrackerState();
}

class _ExpensesTrackerState extends State<ExpensesTracker> {
  List<Expenses> expenses = [];
  double total = 0;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void sum() {
    for (var e in expenses) {
      total += e.amount;
    }
  }

  void showAddExpenseSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Your Expenses",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Amount"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final title = titleController.text;
                  final amount = amountController.text;
                  final data = Expenses(
                    title: title,
                    amount: double.parse(amount),
                  );
                  setState(() {
                    expenses.add(data);
                    sum();
                    titleController.clear();
                    amountController.clear();
                    print(total);
                  });
                  Navigator.pop(context);
                },
                child: Text("ADD"),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expenses Tracker")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddExpenseSheet();
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              expenses.isEmpty
                  ? Text("Data is Empty")
                  : Expanded(
                      child: ListView.builder(
                        itemCount: expenses.length,
                        itemBuilder: (context, index) {
                          final data = expenses[index];
                          return ListTile(
                            title: Text(
                              data.title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "${data.amount}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  expenses.removeAt(index);
                                  // print(expenses);
                                  total = 0;

                                  sum();
                                });
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          );
                        },
                      ),
                    ),
              Text(
                "Total: $total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
