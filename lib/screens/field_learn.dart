import 'package:flutter/material.dart';

class FieldLearn extends StatefulWidget {
  @override
  _FieldLearnState createState() => _FieldLearnState();
}

class _FieldLearnState extends State<FieldLearn> {
  DateTime? _selectedDate;
  String? _selectedRoomType;

  final List<String> roomTypes = [
    '1 in 1',
    '2 in 1',
    '4 in 1',
    '5 in 1',
    '8 in 1'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal,
            hintColor: Colors.teal,
            colorScheme: ColorScheme.light(primary: Colors.teal),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Field Learn'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Date of Birth:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Select Room Type:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: _selectedRoomType,
              hint: Text('Select Room Type'),
              onChanged: (String? value) {
                setState(() {
                  _selectedRoomType = value;
                });
              },
              items: roomTypes.map((String roomType) {
                return DropdownMenuItem<String>(
                  value: roomType,
                  child: Text(roomType),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
