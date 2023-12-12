import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loginregister_authentication/screens/navigation_bar.dart';

class AddStudentController extends GetxController {
  TextEditingController regnoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

  Future<void> addStudent() async {
    var headers = {'Content-Type': 'application/json'};

    try {
      var url = Uri.parse('http://localhost:3500/api/v1/students');

      // Prepare the request body with student details
      Map<String, dynamic> body = {
        'regno': regnoController.text,
        'name': nameController.text,
        'department': departmentController.text,
        'skills': skillsController.text,
      };

      // Send a POST request to the server
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );

      // Check the response status code
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        Get.off(NavigationPage(), arguments: 0);

        // Assuming the server returns the added student details directly
        var regNo = json['regno'];
        var name = json['name'];
        var department = json['department'];
        var skills = json['skills'];

        // Display added student details
        print('Added Student Details:');
        print('Reg No: $regNo');
        print('Name: $name');
        print('Department: $department');
        print('Skills: $skills');

        // Save user data to SharedPreferences
        // final SharedPreferences? prefs = await _prefs;
        // await prefs?.setString('name', name);
        // await prefs?.setString('token',
        //     '');
        // await prefs?.setString('email',
        //     '');

        // Clear text controllers
        regnoController.clear();
        nameController.clear();
        departmentController.clear();
        skillsController.clear();

        // Show a success message using GetX Snackbar with improved UI
        Get.snackbar(
          'Success',
          '$name is added successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.teal,
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(16),
        );
      } else {
        // Handle unexpected errors
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      // Handle errors during the process
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(error.toString())],
          );
        },
      );
    }
  }
}
