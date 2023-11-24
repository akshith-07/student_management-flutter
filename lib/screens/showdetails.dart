import 'package:flutter/material.dart';
import 'package:loginregister_authentication/services/student_details.dart';
import 'package:get/get.dart';
import 'edit_student.dart';
import 'delete_student.dart';

class UserDetailsScreen extends StatelessWidget {
  final StudentDetails studentDetails;

  const UserDetailsScreen({Key? key, required this.studentDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${studentDetails.name}"),
        centerTitle: true,
        backgroundColor: Colors.teal, // Change the app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.teal,
              width: 2.0,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/student.png'),
                  radius: 60.0,
                ),
              ),
              const Divider(
                height: 90.0,
                color: Colors.black,
                thickness: 2.0,
              ),
              _buildDetailRow('Reg No', studentDetails.regno),
              _buildDetailRow('Name', studentDetails.name),
              _buildDetailRow('Department', studentDetails.department),
              _buildDetailRow('Skills', studentDetails.skills),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          Get.to(EditStudent(
                            studentDetails: studentDetails,
                          ));
                        },
                        icon: Icon(Icons.edit),
                        label: Text("Edit")),
                    SizedBox(
                      width: 15.0,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        DeleteStudent(studentDetails: studentDetails)
                            .showDeleteConfirmationDialog(context);
                      },
                      icon: Icon(Icons.delete),
                      label: Text("Delete"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              value.toString(),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
