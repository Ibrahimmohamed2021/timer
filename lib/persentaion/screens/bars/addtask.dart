import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../logic/providers/tasks_provider.dart';
import '../../../data/models/task.dart';
class AddTaskScreen extends StatefulWidget {
  static const String routeName = "/addTask";
  const AddTaskScreen({Key? key}) : super(key: key);
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}
class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? timefornow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: taskNameController,
                    decoration: InputDecoration(
                      hintText: "Enter Task Name",
                      label: const Text("Task Name"),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   DateTimePicker(
                    type: DateTimePickerType.dateTime,
                    controller: timeController,
                    initialValue: '',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Date',
                     onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => setState(() {
                      val = timefornow as String?;
                      print(timefornow);
                    })
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                 onPressed: () async {
               final task =
              Task(taskName: taskNameController.text, autoTimer: timeController.text);
                    taskNameController.clear();
                    timeController.clear();
                      await Provider.of<TasksProvider>(context,
                   listen: false)
                      .addTaskToDB(task);
               Navigator.of(context).pop();
          },
                child: const Text("Add Task")),
          ],
        ),
      ),
    );
  }
}
