import 'package:audioplayers/audioplayers.dart';
import 'package:cheetahflipbook/widgets/book_drawer.dart';
import 'package:cheetahflipbook/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatefulWidget {
 final String? booklocation;

  const PDFViewerPage({
    Key? key, required this.booklocation, }) : super(key: key);



  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage>  {

  late PdfViewerController _pdfViewerController;
  late PdfPageLayoutMode layoutMode = PdfPageLayoutMode.single;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final audioPlayer= AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  late AudioCache audioCache;
  String path = "page-flip-01a.mp3";



  @override
  void dispose(){
    audioPlayer.dispose();
    audioPlayer.release();
    audioCache.clearAll();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState((){
        audioPlayerState = s;
      });
    });
    _pdfViewerController = PdfViewerController();
  }

  playMusic() async{
    await audioCache.play(path);
  }
  pauseMusic() async{
    await audioPlayer.pause();}


  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      drawer: const BookDrawer(),
      appBar:AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.orange,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Image.asset("assets/images/cheetah-logo-no-bg.png",height: 60,),
             FittedBox(
              fit: BoxFit.fitWidth,
                child: Text(
                  widget.booklocation!.substring(7),
                  softWrap: true,
                  maxLines:2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                )),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed:(){
                playMusic();
                previous2Pages(_pdfViewerController);
            },
            icon:const Icon(Icons.arrow_left_sharp,size: 35,),
          ),
          IconButton(
              onPressed:(){
                  playMusic();
                next2Pages(_pdfViewerController);
              },
              icon:const Icon(Icons.arrow_right_sharp,size: 35,),
          ),
          IconButton(
            onPressed:(){
              _pdfViewerKey.currentState?.openBookmarkView();
            },
            icon:const Icon(Icons.search,size: 35,),
          ),
        ],
      ),
      backgroundColor: Colors.grey[350],
      body:Stack  (
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal:120),
            child: SfPdfViewer.asset(
              widget.booklocation!,
              key: _pdfViewerKey,
              pageSpacing:12,
              controller: _pdfViewerController,
              canShowScrollHead:true,
              canShowScrollStatus: false,
              scrollDirection:PdfScrollDirection.horizontal,
              pageLayoutMode:PdfPageLayoutMode.continuous,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              child:const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black54,
                size:130,
              ),
              onTap: () {
                playMusic();
                isPortrait ? _pdfViewerController.previousPage() :  previous2Pages(_pdfViewerController);
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              child:  const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black54,
                size:130,
              ),
              onTap: () {
                  playMusic();
                  isPortrait ? _pdfViewerController.nextPage() :  next2Pages(_pdfViewerController);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*
TODO: Implement dual page book view programmatically
List<PdfPageLayoutMode> doublepageview(List<PdfPageLayoutMode> doubleview){
  for (int x =0; x<2;x++){
    doubleview = [PdfPageLayoutMode.single];
  }
  return doubleview;
}*/

void next2Pages(PdfViewerController currentPage){
  for (int x =0; x<1;x++){
    currentPage.nextPage();
  }
  return currentPage.nextPage();
}

void previous2Pages(PdfViewerController currentPage){
  for (int x =0; x<1;x++){
    currentPage.previousPage();
  }
  return currentPage.previousPage();
}

