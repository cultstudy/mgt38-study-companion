import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class OfflineFileService {
  const OfflineFileService();

  Future<Directory> _libraryDirectory() async {
    final base = await getApplicationDocumentsDirectory();
    final library = Directory('${base.path}/mgt38_library');

    if (!await library.exists()) {
      await library.create(recursive: true);
    }

    return library;
  }

  Future<File?> getDownloadedFile(String fileName) async {
    final directory = await _libraryDirectory();
    final file = File('${directory.path}/$fileName');

    if (await file.exists()) {
      return file;
    }

    return null;
  }

  Future<File> downloadFile({
    required String url,
    required String fileName,
    void Function(double progress)? onProgress,
  }) async {
    final directory = await _libraryDirectory();
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception(
        'Download failed: HTTP ${response.statusCode}',
      );
    }

    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(response.bodyBytes);

    onProgress?.call(1.0);

    return file;
  }

  Future<void> deleteDownloadedFile(String fileName) async {
    final directory = await _libraryDirectory();
    final file = File('${directory.path}/$fileName');

    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<List<FileSystemEntity>> getDownloadedFiles() async {
    final directory = await _libraryDirectory();

    if (!await directory.exists()) {
      return [];
    }

    return directory.list().toList();
  }
}
