import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatefulWidget {
  const PDFViewerPage({Key? key}) : super(key: key);

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {

  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: const Text("Math Book 1"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size:30,
            ),
            onPressed: () {
              _pdfViewerController.previousPage();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size:30,
            ),
            onPressed: () {
              _pdfViewerController.nextPage();
            },
          ),
        ],
      ),
      body:SfPdfViewer.asset(
        "assets/Workbook 1.pdf",
        controller: _pdfViewerController,
        canShowScrollHead: false,
        scrollDirection:PdfScrollDirection.horizontal,
        pageLayoutMode: PdfPageLayoutMode.single,
      ),
    );
  }
}
