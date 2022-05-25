import 'dart:io';

import 'package:cheetahflipbook/screens/pdf_viewer_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookCard extends StatelessWidget {
  const BookCard(
      {Key? key,
        required this.imagePath,
        this.ontap
      })
      : super(key: key);
  final String imagePath;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow:  const [
        BoxShadow(
        color: Colors.grey,
          offset: Offset(
            3.0,
            3.0,
          ),
          blurRadius: 20.0,
          spreadRadius: 5.0,
        ),] //Box
        ),
        child: Image.asset(
          imagePath,
          height: 150,
          fit: BoxFit.cover,
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
      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      crossAxisCount: 2,
      crossAxisSpacing:80,
      mainAxisSpacing: 60,
      children:   [
        BookCard(
          imagePath: "assets/images/EC Math Textbook Term 1.png", ontap: ()  {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PDFViewerPage(
              booklocation:"assets/EC Math Textbook Term 1.pdf" ,
            )),
          );
        }

        ),
        BookCard(
            imagePath: "assets/images/EC Math Textbook Term 2.png",
            ontap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PDFViewerPage(
                  booklocation:"assets/EC Math Textbook Term 2.pdf" ,
                )),
              );
            }
        ),
        BookCard(
            imagePath: "assets/images/EC Math Textbook Term 3.png",
            ontap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PDFViewerPage(
                  booklocation:"assets/EC Math Textbook Term 3.pdf" ,
                )),
              );
            }
        ),
        BookCard(
            imagePath: "assets/images/math-activity-workbook.png",
            ontap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PDFViewerPage(
                  booklocation:"assets/EC Math Activity Workbook.pdf" ,
                )),
              );
            }
        ),
        BookCard(
            imagePath: "assets/images/math-manipulatives.png",
            ontap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PDFViewerPage(
                  booklocation:"assets/EC Math Manipulatives.pdf" ,
                )),
              );
            }
        ),
      ],
    );
  }
}

Future openFile({required String url, String? fileName}) async {
  final file = await downloadFile(url, fileName);
  if (file == null) return;
  print ('Path:${file.path}');
  OpenFile.open(file.path);
}
///Download file into private folder not visible to user
Future<File?> downloadFile(String url,String?  name) async{
  final appStorage = await getApplicationDocumentsDirectory();
  final file = File("${appStorage.path}/$name");
  try {
    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        receiveTimeout: 0,
      ),
    );

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  } catch(e)
  {return null;}
}
