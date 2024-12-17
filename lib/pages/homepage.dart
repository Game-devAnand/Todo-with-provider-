import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/listprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Open settings page (future implementation)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Tasks',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<TaskList>(
                builder: ((context, task, build) => ListView.builder(
                      itemCount: task.tasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(task.tasks[index].id.toString()),
                          child: ListTile(
                            title: Text(task.tasks[index].name.toString()),
                            leading: IconButton(
                              onPressed: () {
                                task.colorChange(task.tasks[index].id);
                                print(task.tasks[index].isComplete);
                              },
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: task.tasks[index].isComplete
                                    ? Colors.green
                                    : Colors.black,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                // print(task.tasks[index].id);
                                task.removeTask(task.tasks[index].id);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            onTap: () {
                              // You can implement task edit functionality here
                              // print('Edit task: ${tasks[index]}');
                            },
                          ),
                        );
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<TaskList>(
        builder: ((context, task, build) => FloatingActionButton(
              onPressed: () async {
                String taskTitle = 'Task to add';

                // Show the dialog
                await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Add New Task'),
                      content: TextField(
                        autofocus: true,
                        onChanged: (text) {
                          taskTitle = text; // Update taskTitle as user types
                        },
                        decoration:
                            const InputDecoration(hintText: 'Enter task name'),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            if (taskTitle.isNotEmpty) {
                              task.addTask(taskTitle);
                              Navigator.of(context).pop(); // Close the dialog
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please enter a task name')),
                              );
                            }
                          },
                          child: const Text('Add Task'),
                        ),
                      ],
                    );
                  },
                );
              },
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )),
      ),
    );
  }
}
