import '../models/material.dart';

class DriveService {
  const DriveService();

  Future<List<StudyMaterial>> getMaterials({
    required String semester,
    String? subject,
  }) async {
    // Google Drive connection will be added here.
    // For now, return an empty list.
    return <StudyMaterial>[];
  }
}
