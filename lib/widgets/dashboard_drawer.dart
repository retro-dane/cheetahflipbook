import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration:  const BoxDecoration(
              color: Colors.orange,
            ), child: Image.asset("assets/images/cheetah-logo-no-bg.png",),
          ),

          ListTile(
            leading: const Icon(Icons.info_outlined),
            title: const Text('About Us'),
            onTap: () {
              //TODO: Update the state of the app.
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Contact Us'),
            onTap: () {
              //TODO: Update the state of the app.
            },
          ),
          ListTile(
            leading: const Icon(Icons.summarize_sharp),
            title: const Text('Math Book Overview'),
            onTap: () {
              //TODO: Update the state of the app.
            },),
          ListTile(
            leading: const Icon(Icons.support_agent_sharp),
            title: const Text('Technical Support'),
            onTap: () {
              //TODO: Update the state of the app.
            },
          ),
        ],
      ),

    );
  }
}




