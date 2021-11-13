import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/persentaion/screens/bars/addtask.dart';
import 'persentaion/myhome.dart';
import 'package:untitled/logic/providers/tasks_provider.dart';
void main() => runApp(const MyApp());
class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyCode();
}
class _MyCode extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TasksProvider(),),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hello World',
        routes: {
          '/': (_) => const MyHome(),
          AddTaskScreen.routeName: (context) => const AddTaskScreen(),
        },
      ),
    );
  }
}