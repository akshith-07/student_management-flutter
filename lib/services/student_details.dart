// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

class StudentDetails {
  int? regno;
  String? name = "";
  String? department = "";
  String? skills = "";

  StudentDetails(
      {required this.regno,
      required this.name,
      required this.department,
      required this.skills});

  StudentDetails.fromJson(Map<String, dynamic> json) {
    regno = json['regno'];
    name = json['name'];
    department = json['department'];
    skills = json['skills'];
  }
}
