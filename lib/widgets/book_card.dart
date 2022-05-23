import 'package:cheetahflipbook/screens/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookCard extends StatelessWidget {
  const BookCard(
      {Key? key, required this.bookTitle, required this.imagePath, this.ontap})
      : super(key: key);
  final String bookTitle;
  final String imagePath;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                -3.0, // Move to right 3  horizontally
                -3.0, // Move to bottom 3 Vertically
              ),
            )
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                height: 100,
              ),
            ),
            Text(
              bookTitle,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
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
      crossAxisSpacing: 15,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 15,
      children:  [
        const BookCard(
          bookTitle: "English Book 1",
          imagePath: "assets/images/english.png",
        ),
        BookCard(
            bookTitle: "Math Book 1",
            imagePath: "assets/images/math.png",
            ontap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PDFViewerPage()),
              );}
        ),
        const BookCard(
            bookTitle: "Science Book 1",
            imagePath: "assets/images/science.png"),
        const BookCard(
            bookTitle: "English Book 2",
            imagePath: "assets/images/english.png"),
        const BookCard(
            bookTitle: "Science Book 1",
            imagePath: "assets/images/science.png"),
        const BookCard(
            bookTitle: "English Book 2",
            imagePath: "assets/images/english.png"),
      ],
    );
  }
}
