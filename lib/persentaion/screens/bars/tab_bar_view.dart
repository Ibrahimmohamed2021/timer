import 'package:flutter/material.dart';
import '../../../persentaion/screens/bars/all_tasks.dart';
import '../../../persentaion/screens/bars/done_screen.dart';
import '../../../persentaion/screens/bars/to_do_screen.dart';
class HomeScreen extends StatefulWidget {
     const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return   const TabBarView(
      children: [
         AllTasks(),
         ToDoScreen(),
         DoneScreen(),
      ],
    );
  }
}