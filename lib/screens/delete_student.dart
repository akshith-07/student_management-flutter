import 'package:flutter/material.dart';
import 'package:loginregister_authentication/controllers/deletestudent_controller.dart';
import 'package:get/get.dart';
// import 'package:loginregister_authentication/screens/home.dart';
import 'package:loginregister_authentication/services/student_details.dart';

class DeleteStudent {
  final StudentDetails studentDetails;

  DeleteStudentController deleteStudentController =
      Get.put(DeleteStudentController());

  DeleteStudent({required this.studentDetails});

  Future<void> showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Student'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to delete the student?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                deleteStudentController
                    .deleteStudent(studentDetails.name ?? "");
                // deleteStudentController.deleteStudent(studentDetails.name);
                // Get.offAll(HomeScreen());
              },
            ),
          ],
        );
      },
    );
  }
}
