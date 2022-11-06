import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../helpers/PdfExport.dart';
import '../models/Invoice.dart';

class PdfPreviewPage extends StatelessWidget {
  final Invoice invoice;

  const PdfPreviewPage({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
        backgroundColor: Colors.blue,
      ),
      body: PdfPreview(
        build: (context) => makePdf(invoice),
      ),
    );
  }
}
