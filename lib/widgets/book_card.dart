import 'package:cheetahflipbook/screens/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookCard extends StatelessWidget {
  const BookCard(
      {Key? key, required this.imagePath, this.ontap})
      : super(key: key);
  final String imagePath;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ClipRRect(
        child:Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
          ),
          child: Image.asset(
            imagePath,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 25,
      padding: const EdgeInsets.all(0),
      mainAxisSpacing: 15,
      children:  [
        const BookCard(
          imagePath: "assets/images/book-cover-1.png",
        ),
        BookCard(
            imagePath: "assets/images/book-cover-2.png",
            ontap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PDFViewerPage()),
              );}
        ),
        const BookCard(
            imagePath: "assets/images/book-cover-3.png",
        ),
        const BookCard(
            imagePath: "assets/images/book-cover-4.png"),
      ],
    );
  }
}
