import 'package:broadway_example_ui/provider/counter_screen_with_provider.dart';
import 'package:broadway_example_ui/provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskModel {
  String title;
  bool isDone;
  TaskModel({required this.title, this.isDone = false});
}

class TodoScreenWithProvider extends StatefulWidget {
  const TodoScreenWithProvider({super.key});

  @override
  State<TodoScreenWithProvider> createState() => _TodoScreenWithProviderState();
}

class _TodoScreenWithProviderState extends State<TodoScreenWithProvider> {
  final controller = TextEditingController();
  // List<TaskModel> task = [];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Todo Screen with Provider")),
      body: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              label: Text("Task"),
              hintText: "Enter your task",
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final TaskModel value = TaskModel(title: controller.text);
              provider.addTask(value);
            },
            child: Text("Add Task"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.task.length,
              itemBuilder: (context, index) {
                final tk = provider.task[index];
                return ListTile(
                  title: Text(tk.title),
                  subtitle: Text("${tk.isDone}"),
                  trailing: IconButton(
                    onPressed: () {
                      provider.changeTask(index);
                    },
                    icon: Icon(Icons.swipe),
                  ),
                );
              },
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CounterScreenWithProvider(),
                ),
              );
            },
            child: Text("Next Screen"),
          ),
        ],
      ),
    );
  }
}
