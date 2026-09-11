import 'package:flutter/material.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});

  static const semesters = [
    '1st Semester',
    '2nd Semester',
    '3rd Semester',
    '4th Semester',
    '5th Semester',
    '6th Semester',
    '7th Semester',
    '8th Semester',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Materials'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: semesters.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(
                semesters[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Subjects & study resources'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${semesters[index]} selected'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
