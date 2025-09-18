import 'package:flutter/material.dart';

class RddDashboard extends StatelessWidget {
  final List<String> schools = [
    'School A',
    'School B',
    'School C',
  ]; // Dummy data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RDD Dashboard')),
      body: ListView.builder(
        itemCount: schools.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(schools[index]),
            onTap: () {
              // TODO: Navigate to school detail
            },
          );
        },
      ),
    );
  }
}
