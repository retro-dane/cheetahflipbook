

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatefulWidget {
  const PDFViewerPage({Key? key}) : super(key: key);

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {

  late PdfViewerController _pdfViewerController;
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
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: Colors.deepOrange,
        title: const Text("Early Childhood Math Activity Workbook"),
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
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:50),
            child: SfPdfViewer.asset(
              "assets/Workbook 1.pdf",
              key: _pdfViewerKey,
              controller: _pdfViewerController,
              canShowScrollHead:true,
              canShowScrollStatus: false,
              scrollDirection:PdfScrollDirection.horizontal,
              pageLayoutMode: PdfPageLayoutMode.continuous,
            ),
          ),
          Positioned(
              top:280,
              right:1190,
              child: InkWell(
                child:const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black54,
                  size:130,
                ),
                onTap: () {
                  playMusic();
               previous2Pages(_pdfViewerController);
                },
              ), ),
          Positioned(
            left:1190,
            top: 280,
            child: InkWell(
              child:  const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black54,
                size:130,
              ),
              onTap: () {
                  playMusic();
              next2Pages(_pdfViewerController);
              },
            ),
          ),
        ],
      ),
    );
  }
}

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

