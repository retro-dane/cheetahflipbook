import 'package:cheetahflipbook/widgets/dashboard_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/dashboard.dart';

class BookDrawer extends StatelessWidget {
  const BookDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
            DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.orange,
            ), child: Image.asset("assets/images/cheetah-logo-no-bg.png",),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.book_sharp
            ),
            title: const Text('Erly Childhood Math Manipulatives'),
            onTap: () {
              //TODO: Update the state of the app.
            },
          ),
          ListTile(
            leading: const Icon(
                Icons.book_sharp
            ),
            title: const Text('Early Childhood Math Activity Workbook'),
            onTap: () {
              //TODO: Update the state of the app.
            },
          ),
          ListTile(
            leading: const Icon(
                Icons.book_sharp
            ),
            title: const Text('Early Childhood Home Connections'),
            onTap: () {
              //TODO: Update the state of the app.
            },
          ),
        ],
      ),

    );
  }
}