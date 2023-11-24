import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loginregister_authentication/services/student_details.dart';
import 'dart:convert';
import 'package:loginregister_authentication/screens/showdetails.dart';
import 'auth/auth_screen.dart';
import 'package:loginregister_authentication/screens/mydrawer_header.dart';
import 'package:loginregister_authentication/screens/add_student.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<List<StudentDetails>> ReadJsonData() async {
    var url = Uri.parse('http://localhost:3500/api/v1/students');

    http.Response response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    final list = json.decode(response.body) as List<dynamic>;

    return list
        .map(
          (e) => StudentDetails.fromJson(e),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 8),
              ],
            ),
            Expanded(child: Center(child: Text("Student Details"))),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30,
            onPressed: () async {
              Get.to(AddStudent());
            },
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(Icons.edit),
            iconSize: 20,
            onPressed: () async {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text(
                "Error: ${data.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (data.hasData) {
            var items = data.data as List<StudentDetails>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: const Color.fromARGB(255, 76, 194, 166),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsScreen(
                                    studentDetails: items[index],
                                  ),
                                ),
                              );
                            },
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            leading: Text(
                              "Reg No : ${items[index].regno.toString()}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Text(
                              "Department : ${items[index].department.toString()}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Name : ${items[index].name.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyDrawerHeader(),
                SizedBox(
                  height: 400,
                ),
                TextButton.icon(
                    onPressed: () async {
                      final SharedPreferences? prefs = await _prefs;
                      prefs?.clear();
                      Get.offAll(AuthScreen());
                    },
                    icon: Icon(Icons.logout),
                    label: Text("Logout"))
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
