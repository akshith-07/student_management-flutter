import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawerHeader extends StatefulWidget {
  @override
  _MyDrawerHeaderState createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  late String userName = "";
  late String userEmail = "";

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'Default Name';
      userEmail = prefs.getString('email') ?? 'Default Email';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/student.png'),
              ),
            ),
          ),
          Text(
            userName,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            userEmail,
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
