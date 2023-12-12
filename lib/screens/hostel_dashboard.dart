import 'package:flutter/material.dart';

class HostelDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel Management Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hostel Overview',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardCard(
                    title: 'Total Hostels',
                    value: '5',
                    icon: Icons.apartment,
                    color: Colors.blue,
                  ),
                  DashboardCard(
                    title: 'Occupied Rooms',
                    value: '120',
                    icon: Icons.people,
                    color: Colors.orange,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardCard(
                    title: 'Available Rooms',
                    value: '80',
                    icon: Icons.event_seat,
                    color: Colors.green,
                  ),
                  DashboardCard(
                    title: 'Total Students',
                    value: '200',
                    icon: Icons.school,
                    color: Colors.purple,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Financial Overview',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardCard(
                    title: 'Total Revenue',
                    value: '\$50,000',
                    icon: Icons.attach_money,
                    color: Colors.teal,
                  ),
                  DashboardCard(
                    title: 'Pending Payments',
                    value: '\$5,000',
                    icon: Icons.warning,
                    color: Colors.red,
                  ),
                  DashboardCard(
                    title: 'Collected Payments',
                    value: '\$45,000',
                    icon: Icons.check_circle,
                    color: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Maintenance Status',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardCard(
                    title: 'Pending Repairs',
                    value: '5',
                    icon: Icons.build,
                    color: Colors.yellow,
                  ),
                  DashboardCard(
                    title: 'Completed Repairs',
                    value: '15',
                    icon: Icons.build,
                    color: Colors.green,
                  ),
                  DashboardCard(
                    title: 'On Maintenance',
                    value: '8',
                    icon: Icons.build,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Student Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardCard(
                    title: 'New Admissions',
                    value: '30',
                    icon: Icons.person_add,
                    color: Colors.orange,
                  ),
                  DashboardCard(
                    title: 'Graduated Students',
                    value: '10',
                    icon: Icons.school,
                    color: Colors.grey,
                  ),
                  DashboardCard(
                    title: 'Enrolled Students',
                    value: '190',
                    icon: Icons.people,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Visitor Log',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardCard(
                    title: 'Recent Visitors',
                    value: '15',
                    icon: Icons.people,
                    color: Colors.blue,
                  ),
                  DashboardCard(
                    title: 'Visitor Statistics',
                    value: '150',
                    icon: Icons.bar_chart,
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        color: color,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
