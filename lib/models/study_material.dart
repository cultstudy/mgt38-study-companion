class StudyMaterial {
  final String id;
  final String title;
  final String subject;
  final String semester;
  final String fileUrl;
  final String fileType;
  final String? description;

  const StudyMaterial({
    required this.id,
    required this.title,
    required this.subject,
    required this.semester,
    required this.fileUrl,
    required this.fileType,
    this.description,
  });
}
