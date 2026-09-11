import 'package:flutter/material.dart';
import 'pdf_reader_screen.dart';

class MaterialsListScreen extends StatelessWidget {
  final String subject;

  const MaterialsListScreen({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _MaterialCard(
            title: '$subject - Lecture 01',
            subtitle: 'Sample PDF',
            onOpen: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PdfReaderScreen(
                    title: 'Sample PDF',
                  ),
                ),
              );
            },
          ),
          _MaterialCard(
            title: '$subject - Lecture 02',
            subtitle: 'Sample PDF',
            onOpen: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PdfReaderScreen(
                    title: 'Sample PDF',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MaterialCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onOpen;

  const _MaterialCard({
    required this.title,
    required this.subtitle,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.picture_as_pdf),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onOpen,
      ),
    );
  }
}
