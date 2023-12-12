import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginregister_authentication/screens/hostel_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loginregister_authentication/services/student_details.dart';
import 'dart:convert';
import 'package:loginregister_authentication/screens/showdetails.dart';
import 'auth/auth_screen.dart';
import 'package:loginregister_authentication/screens/mydrawer_header.dart';
import 'package:loginregister_authentication/screens/add_student.dart';
import 'package:http/http.dart' as http;
import 'package:loginregister_authentication/screens/field_learn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController searchController = TextEditingController();

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

  List<StudentDetails> filterStudents(
      String query, List<StudentDetails> students) {
    return students.where((student) {
      final nameLower = student.name!.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
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
            icon: Icon(Icons.school),
            iconSize: 30,
            onPressed: () async {
              Get.to(FieldLearn());
            },
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(Icons.dashboard),
            iconSize: 20,
            onPressed: () async {
              Get.to(HostelDashboard());
            },
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
            var allStudents = data.data as List<StudentDetails>;
            var filteredStudents =
                filterStudents(searchController.text, allStudents);

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      labelText: 'Search by Name',
                      labelStyle: TextStyle(fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                        },
                      ),
                    ),
                    onChanged: (query) {
                      setState(() {
                        filteredStudents = filterStudents(query, allStudents);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredStudents.length,
                    itemBuilder: (context, index) {
                      var student = filteredStudents[index];
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
                                          studentDetails: student,
                                        ),
                                      ),
                                    );
                                  },
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  leading: Text(
                                    "Reg No : ${student.regno.toString()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: Text(
                                    "Department : ${student.department.toString()}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Name : ${student.name.toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
                  height: 380,
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
