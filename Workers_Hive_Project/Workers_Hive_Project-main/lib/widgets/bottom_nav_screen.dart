import 'package:flutter/material.dart';
import 'package:workers_project/screen/add_screen.dart';
import 'package:workers_project/screen/confirm_screen.dart';
import 'package:workers_project/screen/home_screen.dart';
import 'package:workers_project/screen/settings_screen.dart';

class MyBottom extends StatefulWidget {
  const MyBottom({super.key});

  @override
  State<MyBottom> createState() => _MyBottomState();
}

class _MyBottomState extends State<MyBottom> {
  List<Widget> pages = [
    const ScreenHome(),
    const AddScreen(),
    const ListScreen(),
    const SettingsScreen()
  ];
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 132, 131, 131),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        onTap: (index) => setState(() {
          myIndex = index;
        }),
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu), label: 'Confirm List'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
    );
  }
}
