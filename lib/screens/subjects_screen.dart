import 'package:flutter/material.dart';
import '../models/study_subject.dart';

class SubjectsScreen extends StatelessWidget {
  final String semester;

  const SubjectsScreen({
    super.key,
    required this.semester,
  });

  List<StudySubject> get subjects {
    // Temporary sample subjects.
    // We'll replace these with your actual MGT38 subjects later.
    return const [
      StudySubject(name: 'Management Accounting', code: 'Sample'),
      StudySubject(name: 'Human Resource Management', code: 'Sample'),
      StudySubject(name: 'Finance', code: 'Sample'),
      StudySubject(name: 'Marketing', code: 'Sample'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(semester),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.menu_book_outlined),
              ),
              title: Text(
                subject.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(subject.code),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${subject.name} selected',
                    ),
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
