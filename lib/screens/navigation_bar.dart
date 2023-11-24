import 'package:flutter/material.dart';
import 'package:loginregister_authentication/screens/add_student.dart';
import 'package:loginregister_authentication/screens/home.dart';
import 'package:get/get.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  List<Widget> pageList = [
    const HomeScreen(),
    const AddStudent(),
    const Placeholder(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    // Get the initial index from arguments
    final initialIndex = Get.arguments ?? 0;

    // Set the initial index
    _selectedIndex = initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Student',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
