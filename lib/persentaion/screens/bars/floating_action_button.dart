import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'addtask.dart';
import '../../../persentaion/screens/bars/tab_bar_view.dart';
import '../../../data/models/task.dart';
import '../../../logic/helpers/db_helper.dart';
import '../../../logic/providers/tasks_provider.dart';
class DownBar extends StatefulWidget{
  const DownBar({Key? key}) : super(key: key);
  @override
  State<DownBar> createState() => _Down();
}
class _Down extends State<DownBar>{
  Database? db;
  List<Task> tasks = [];
  int _selectedIndex = 0;
  bool isready = false;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      isready = false;
    });
  }
  void  _onitemtappedtop(int index){
    setState(() {
      isready = true;
    });
  }
   @override
   void initState() {
     intilizeDB();
     super.initState();
   }
   Future<void> intilizeDB() async {
     db = await DBHelper.database();
   }
  @override
  Widget build(BuildContext context) {
    tasks = Provider.of<TasksProvider>(context).tasks;
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Shark Notes',
          style: TextStyle(fontSize: 20, color: Colors.green ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        bottom:  TabBar(
          onTap: _onitemtappedtop,
          labelColor: Colors.green,
          tabs: const <Widget>[
            Tab(text: 'Tasks',),
            Tab(text: 'UnFinish',),
            Tab(text: 'Finish',),
           ],
        ) ,
      ),
      body: isready  ?     const HomeScreen(
      ) : Center(child: _widgetOptions.elementAt(_selectedIndex),),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var text = await Navigator.of(context)
              .pushNamed(AddTaskScreen.routeName) as String;
          setState(() {
            final task = Task(taskName: text, autoTimer: text);
            tasks.add(task);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


