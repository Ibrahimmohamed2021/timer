import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data/models/task.dart';
import 'package:untitled/logic/providers/tasks_provider.dart';
class ToDoScreen extends StatefulWidget {
   const ToDoScreen({Key? key}) : super(key: key);
  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}
class _ToDoScreenState extends State<ToDoScreen> {
   bool isLoading = true;
   List<Task> toDoTasks = [];
   DateTime selectedDate = DateTime.now();
  // get index => Provider.of<TasksProvider>(context);
   //var hellotime =

   // Future<void> _selectDate(BuildContext context) async {
   //   await  =  selectedDate;
   //   if (selectedDate != null && toDoTasks[index].autoTimer != selectedDate)
   //     setState(() {
   //       isLoading = false;
   //     });
   // }
   // Future <void> donedone() async{
   //   toDoTasks[index].autoTimer != await selectedDate;
   //   setState(() {
   //     isLoading = false;
   //   });
   // }
   @override
  Widget build(BuildContext context) {
    toDoTasks = Provider.of<TasksProvider>(context).tasks;
    toDoTasks = toDoTasks.where((element) => element.isDone == false).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(toDoTasks[index].taskName,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                decoration: toDoTasks[index].isDone
                    ? TextDecoration.lineThrough
                    : null,
              ),
          ),
          trailing: isLoading?  const CircularProgressIndicator(
          )
              : const Text('done'),
        );
      },
      itemCount: toDoTasks.length,
    );
  }
}
