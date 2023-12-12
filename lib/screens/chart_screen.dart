// chart_screen.dart

import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart Screen'),
      ),
      body: Center(
        child: Text('This is the Chart Screen'),
      ),
    );
  }
}
