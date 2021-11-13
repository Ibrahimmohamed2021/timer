import 'package:flutter/material.dart';
import 'package:untitled/persentaion/screens/bars/floating_action_button.dart';
class MyHome extends StatefulWidget{
  const MyHome({Key? key}) : super(key: key);
  @override
  State<MyHome> createState() => _MyBar();
}
class _MyBar extends State<MyHome>{
  @override
  Widget build(BuildContext context){
    return const DefaultTabController(
      length: 3,
      child:Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: DownBar (),
      ),
    );
  }
}