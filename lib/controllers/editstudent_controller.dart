// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:loginregister_authentication/utils/api_endpoints.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class EditStudentController extends GetxController {
//   TextEditingController regnoController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController departmentController = TextEditingController();
//   TextEditingController skillsController = TextEditingController();
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   Future<void> validateStudent() async {
//     var headers = {'Content-Type': 'application/json'};

//     try {
//       var url = Uri.parse('http://localhost:3500/api/v1/students/validate');

//       Map<String, dynamic> body = {
//         'name': nameController.text,
//       };

//       http.Response response = await http.post(
//         url,
//         body: jsonEncode(body),
//         headers: headers,
//       );

//       if (response.statusCode == 200) {
//         final json = jsonDecode(response.body);

//         var regNo = json['regno'];
//         var name = json['name'];
//         var department = json['department'];
//         var skills = json['skills'];

//         regnoController.text = regNo.toString();
//         departmentController.text = department;
//         skillsController.text = skills;
//       } else {
//         throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occurred";
//       }
//     } catch (error) {
//       Get.back();
//       showDialog(
//         context: Get.context!,
//         builder: (context) {
//           return SimpleDialog(
//             title: Text('Error'),
//             contentPadding: EdgeInsets.all(20),
//             children: [Text(error.toString())],
//           );
//         },
//       );
//     }
//   }

//   Future<void> editStudent() async {
//     var headers = {'Content-Type': 'application/json'};

//     try {
//       var url = Uri.parse('http://localhost:3500/api/v1/students');

//       Map<String, dynamic> body = {
//         'regno': regnoController.text,
//         'name': nameController.text,
//         'department': departmentController.text,
//         'skills': skillsController.text,
//       };

//       http.Response response = await http.patch(
//         url,
//         body: jsonEncode(body),
//         headers: headers,
//       );

//       if (response.statusCode == 200) {
//         final json = jsonDecode(response.body);

//         var ismodified = json['modifiedcount'];
//         print('Modified ::$ismodified');

//         regnoController.clear();
//         nameController.clear();
//         departmentController.clear();
//         skillsController.clear();

//         Get.off(HomeScreen());
//       } else {
//         throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occurred";
//       }
//     } catch (error) {
//       Get.back();
//       showDialog(
//         context: Get.context!,
//         builder: (context) {
//           return SimpleDialog(
//             title: Text('Error'),
//             contentPadding: EdgeInsets.all(20),
//             children: [Text(error.toString())],
//           );
//         },
//       );
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loginregister_authentication/screens/navigation_bar.dart';
// import 'package:loginregister_authentication/services/student_details.dart';

class EditStudentController extends GetxController {
  TextEditingController regnoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

  Future<void> editStudent() async {
    var headers = {'Content-Type': 'application/json'};

    try {
      var url = Uri.parse('http://localhost:3500/api/v1/students');

      Map<String, dynamic> body = {
        'regno': regnoController.text,
        'name': nameController.text,
        'department': departmentController.text,
        'skills': skillsController.text,
      };

      http.Response response = await http.patch(
        url,
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        var student = json['name'];
        print('Updated Student Name: $student');

        regnoController.clear();
        nameController.clear();
        departmentController.clear();
        skillsController.clear();

        Get.off(NavigationPage(), arguments: 0);
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
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
