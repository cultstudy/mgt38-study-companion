class StudyMaterial {
  final String id;
  final String title;
  final String subject;
  final String semester;
  final String fileUrl;
  final String fileName;
  final int fileSize;
  final bool isPdf;

  const StudyMaterial({
    required this.id,
    required this.title,
    required this.subject,
    required this.semester,
    required this.fileUrl,
    required this.fileName,
    required this.fileSize,
    this.isPdf = true,
  });
}
