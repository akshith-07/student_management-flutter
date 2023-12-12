import 'package:flutter/material.dart';
import 'package:loginregister_authentication/screens/add_student.dart';
import 'package:loginregister_authentication/screens/home.dart';
import 'package:loginregister_authentication/screens/datatable_view.dart';
import 'package:loginregister_authentication/screens/chart_screen.dart';
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
    DataTableView(), // Use the DataTableView here
    ChartScreen(), // Add the ChartScreen here
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

    // Call fetchData when the widget is initialized
    // if (_selectedIndex == 2) {
    //   (pageList[2] as DataTableView).fetchData();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
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
            icon: Icon(Icons.view_agenda),
            label: 'View',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Chart', // Label for the new Chart item
          ),
        ],
      ),
    );
  }
}
