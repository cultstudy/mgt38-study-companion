import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderScreen extends StatefulWidget {
  final String title;
  final String? filePath;
  final String? url;

  const PdfReaderScreen({
    super.key,
    required this.title,
    this.filePath,
    this.url,
  });

  @override
  State<PdfReaderScreen> createState() => _PdfReaderScreenState();
}

class _PdfReaderScreenState extends State<PdfReaderScreen> {
  final PdfViewerController _controller = PdfViewerController();
  final GlobalKey<SfPdfViewerState> _pdfViewerKey =
      GlobalKey<SfPdfViewerState>();

  @override
  Widget build(BuildContext context) {
    final hasLocalFile = widget.filePath != null;
    final hasUrl = widget.url != null;

    if (!hasLocalFile && !hasUrl) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(
          child: Text('No PDF file was provided.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
          IconButton(
            tooltip: 'More',
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: hasLocalFile
          ? SfPdfViewer.file(
              File(widget.filePath!),
              key: _pdfViewerKey,
              controller: _controller,
              enableDoubleTapZooming: true,
            )
          : SfPdfViewer.network(
              widget.url!,
              key: _pdfViewerKey,
              controller: _controller,
              enableDoubleTapZooming: true,
            ),
    );
  }
}
