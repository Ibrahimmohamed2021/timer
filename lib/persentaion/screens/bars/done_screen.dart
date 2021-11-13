import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../data/models/task.dart';
import '../../../logic/providers/tasks_provider.dart';
class DoneScreen extends StatefulWidget {
   const DoneScreen({Key? key}) : super(key: key);
  @override
  State<DoneScreen> createState() => _DoneScreenState();
}
class _DoneScreenState extends State<DoneScreen> {
   List<Task> tasks =[];
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TasksProvider>(context).tasks;
    tasks = tasks.where((element) => element.isDone == true).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onLongPress: () {},
          title: Text(tasks[index].taskName),
          trailing:
          Text(DateFormat("dd/MM hh:mm").format(tasks[index].doneTime!)),
        );
      },
      itemCount: tasks.length,
    );
  }
}