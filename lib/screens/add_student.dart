import 'package:flutter/material.dart';
import 'package:loginregister_authentication/controllers/addstudent_controller.dart';
import 'package:loginregister_authentication/screens/auth/widgets/input_fields.dart';
import 'package:loginregister_authentication/screens/auth/widgets/submit_button.dart';
import 'package:get/get.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  AddStudentController addStudentController = Get.put(AddStudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Add New Student"),
        centerTitle: true,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 80),
            InputTextFieldWidget(
                addStudentController.regnoController, 'Reg No'),
            SizedBox(height: 20),
            InputTextFieldWidget(addStudentController.nameController, 'Name'),
            SizedBox(height: 20),
            InputTextFieldWidget(
              addStudentController.departmentController,
              'Department',
            ),
            SizedBox(height: 20),
            InputTextFieldWidget(
              addStudentController.skillsController,
              'Skills',
            ),
            SizedBox(height: 40),
            SubmitButton(
              onPressed: () => addStudentController.addStudent(),
              title: 'Add Student',
            ),
          ],
        ),
      ),
    );
  }
}
