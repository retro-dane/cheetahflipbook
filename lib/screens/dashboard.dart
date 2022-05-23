import 'package:cheetahflipbook/widgets/book_card.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      endDrawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black, size: 30),
            elevation:0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image.asset(
                    'assets/images/girlprofilepic.jpg',
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                const Icon(Icons.search),
              ],
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body:Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:AssetImage(
                    "assets/images/jungle-background-1.jpg",
                  )
              )
          ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Kerry-Ann",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              child: BookList()
            )
          ],
        ),
      ),
    );
  }
}
