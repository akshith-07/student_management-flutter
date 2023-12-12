import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginregister_authentication/services/student_details.dart';

class DataTableView extends StatefulWidget {
  @override
  _DataTableViewState createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  int _rowsPerPage = 8;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  List<StudentDetails> _students = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('http://localhost:3500/api/v1/students');
    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<StudentDetails> students =
            data.map((e) => StudentDetails.fromJson(e)).toList();

        setState(() {
          _students = students;
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      header: Text('Student Details'),
      rowsPerPage: _rowsPerPage,
      onRowsPerPageChanged: (value) {
        setState(() {
          _rowsPerPage = value ?? 8;
        });
      },
      availableRowsPerPage: [8, 16, 24],
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAscending,
      columns: [
        DataColumn(
          label: Text('Reg No'),
          onSort: (columnIndex, ascending) {
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if (ascending) {
                _students.sort((a, b) => a.regno!.compareTo(b.regno!));
              } else {
                _students.sort((a, b) => b.regno!.compareTo(a.regno!));
              }
            });
          },
        ),
        DataColumn(
          label: Text('Name'),
          onSort: (columnIndex, ascending) {
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if (ascending) {
                _students.sort((a, b) => a.name!.compareTo(b.name!));
              } else {
                _students.sort((a, b) => b.name!.compareTo(a.name!));
              }
            });
          },
        ),
        DataColumn(
          label: Text('Department'),
          onSort: (columnIndex, ascending) {
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if (ascending) {
                _students
                    .sort((a, b) => a.department!.compareTo(b.department!));
              } else {
                _students
                    .sort((a, b) => b.department!.compareTo(a.department!));
              }
            });
          },
        ),
      ],
      source: StudentDataTableSource(_students),
    );
  }
}

class StudentDataTableSource extends DataTableSource {
  final List<StudentDetails> _students;

  StudentDataTableSource(this._students);

  @override
  DataRow getRow(int index) {
    final student = _students[index];
    return DataRow(
      cells: [
        DataCell(Text(student.regno.toString())),
        DataCell(Text(student.name!)),
        DataCell(Text(student.department!)),
      ],
    );
  }

  @override
  int get rowCount => _students.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
