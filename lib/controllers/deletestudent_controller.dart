import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loginregister_authentication/screens/navigation_bar.dart';

class DeleteStudentController extends GetxController {
  Future<void> deleteStudent(String studentName) async {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse('http://localhost:3500/api/v1/students/');

    try {
      http.Response response = await http.delete(
        url,
        body: '{"name": "$studentName"}',
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.off(NavigationPage(), arguments: 0);

        final json = response.body;
        var isDeleted = jsonDecode(json)['deletedcount'];
        print('Deleted: $isDeleted');
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      print(error);
    }
  }
}
