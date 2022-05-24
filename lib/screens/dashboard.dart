import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:cheetahflipbook/widgets/book_card.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}



class _DashboardState extends State<Dashboard> {
  final audioPlayer= AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PLAYING;
  late AudioCache audioCache;
  String path = "Jarvis Peaceful Reggae.wav";


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
  }

  playMusic() async{
    await audioCache.loop(path);

  }
  pauseMusic() async{
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:AssetImage(
                    "assets/images/jungle-background-1.jpg",
                  )
              )
          ),),
       /* BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Container(),
        ),*/
        Scaffold(
              backgroundColor: Colors.transparent,
              body:Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width:100,),
                        Image.asset(
                          "assets/images/cheetah-logo-no-bg.png",
                          height: 200,
                        ),
                        const SizedBox(width:30,),
                        InkWell(
                          onTap: () {
                            audioPlayerState == PlayerState.PLAYING ? pauseMusic():playMusic();
                          },
                          child: Icon(
                            audioPlayerState == PlayerState.PLAYING ? Icons.volume_up_sharp: Icons.volume_off_sharp,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top:10),
                        width: 550,
                          child: const BookList(),
                            ),
                    ),
                  ],
                ),
              ),
        ),
      ],
    );
  }
}
