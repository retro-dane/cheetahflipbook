import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:cheetahflipbook/widgets/book_card.dart';
import 'package:cheetahflipbook/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PLAYING;
  late AudioCache audioCache;
  String path = "Jarvis Peaceful Reggae.wav";

  @override
  void dispose() {
    audioPlayer.dispose();
    audioPlayer.release();
    audioCache.clearAll();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
    playMusic();
  }

  playMusic() async {
    await audioCache.loop(path);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/landingpage web.png",
          fit: BoxFit.cover,
          width: double.infinity,
          //alignment: Alignment.topCenter,
        ),
        Scaffold(
          key: _scaffoldKey,
          drawer: const DashboardDrawer(),
          floatingActionButton: Container(
            height: 60,
            width: 60,
            child: Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5.0),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset("assets/images/Cheetah-dog.png"),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          backgroundColor:Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            leading: Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: IconButton(
                color: Colors.black,
                icon: const Icon(
                  Icons.menu,
                  size: 50,
                ),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
            ),
            centerTitle: true,
            title: const CircleAvatar(
              radius:30,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/cheetah-logo-no-bg.png"),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            actions: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: InkWell(
                  onTap: () {
                    audioPlayerState == PlayerState.PLAYING
                        ? pauseMusic()
                        : playMusic();
                  },
                  child: Icon(
                    audioPlayerState == PlayerState.PLAYING
                        ? Icons.volume_up_sharp
                        : Icons.volume_off_sharp,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              const Expanded(
                  flex: 1,
                  child: SizedBox()
              ),
              const SizedBox(height: 100,),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60),
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Explore",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: const [
                                Text("View All",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 25,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Flexible(child: BookList()),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.deepOrange,
            shape: const CircularNotchedRectangle(),
            notchMargin: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(height: 60.0,width: 1.0,),
                IconButton(
                  icon: const Icon(
                    Icons.space_bar,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.space_bar,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.space_bar,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
