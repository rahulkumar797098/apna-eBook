import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LocalPdfFullScreen extends StatelessWidget {
  final String assetPath;

  const LocalPdfFullScreen({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Book'),
      ),
      body: SfPdfViewer.asset(assetPath),  // Use asset for local PDF files
    );
  }
}
