// import 'package:flutter/material.dart';
// import 'package:loginregister_authentication/controllers/editstudent_controller.dart';
// import 'package:loginregister_authentication/screens/auth/widgets/input_fields.dart';
// import 'package:loginregister_authentication/screens/auth/widgets/submit_button.dart';
// import 'package:get/get.dart';

// class EditStudent extends StatefulWidget {
//   const EditStudent({super.key});

//   @override
//   State<EditStudent> createState() => _EditStudentState();
// }

// class _EditStudentState extends State<EditStudent> {
//   EditStudentController editStudentController =
//       Get.put(EditStudentController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text("Edit Student"),
//         centerTitle: true,
//         actions: [],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(32.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 80),
//             InputTextFieldWidget(editStudentController.nameController, 'Name'),
//             SizedBox(height: 20),
//             SubmitButton(
//               onPressed: () => editStudentController.validateStudent(),
//               title: 'Validate',
//             ),
//             SizedBox(height: 40),
//             InputTextFieldWidget(
//                 editStudentController.regnoController, 'Reg No'),
//             SizedBox(height: 20),
//             InputTextFieldWidget(
//               editStudentController.departmentController,
//               'Department',
//             ),
//             SizedBox(height: 20),
//             InputTextFieldWidget(
//               editStudentController.skillsController,
//               'Skills',
//             ),
//             SizedBox(height: 40),
//             SubmitButton(
//               onPressed: () => editStudentController.editStudent(),
//               title: 'Edit Student',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:loginregister_authentication/services/student_details.dart';
import 'package:loginregister_authentication/controllers/editstudent_controller.dart';

import 'package:get/get.dart';

class EditStudent extends StatefulWidget {
  final StudentDetails studentDetails;

  const EditStudent({Key? key, required this.studentDetails}) : super(key: key);

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  EditStudentController editStudentController =
      Get.put(EditStudentController());

  TextEditingController regnoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with the existing student details
    regnoController.text = widget.studentDetails.regno.toString();
    nameController.text = widget.studentDetails.name.toString();
    departmentController.text = widget.studentDetails.department.toString();
    skillsController.text = widget.studentDetails.skills.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit ${widget.studentDetails.name}"),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
              // Add your UI widgets for editing, for example:
              _buildEditField('Reg No', regnoController),
              _buildEditField('Name', nameController),
              _buildEditField('Department', departmentController),
              _buildEditField('Skills', skillsController),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    editStudentController.regnoController.text =
                        regnoController.text;
                    editStudentController.nameController.text =
                        nameController.text;
                    editStudentController.departmentController.text =
                        departmentController.text;
                    editStudentController.skillsController.text =
                        skillsController.text;
                    editStudentController.editStudent();
                    // Navigator.pop(context);
                  },
                  icon: Icon(Icons.save),
                  label: Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditField(String label, TextEditingController controller) {
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
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
