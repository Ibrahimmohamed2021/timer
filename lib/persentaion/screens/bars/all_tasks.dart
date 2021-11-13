import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../logic/providers/tasks_provider.dart';
import '../../../data/models/task.dart';
class AllTasks extends StatefulWidget {
  const AllTasks({
    Key? key,
  }) : super(key: key);
  @override
  State<AllTasks> createState() => _AllTasksState();
}
class _AllTasksState extends State<AllTasks> {
  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    tasks = Provider.of<TasksProvider>(context).tasks;
    return FutureBuilder(
        future:
        Provider.of<TasksProvider>(context, listen: false).getTasksFromDB(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  tasks[index].taskName,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration: tasks[index].isDone
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                trailing: Checkbox(
                  onChanged: (val) async {
                    tasks[index].isDone = val!;
                    if (val) {
                      tasks[index].doneTime = DateTime.now();
                    }
                    await Provider.of<TasksProvider>(context,
                        listen: false)
                        .updateTask(tasks[index]);
                  },
                  value: tasks[index].isDone,
                ),
              );
            },
            itemCount: tasks.length,
          )
              : const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}