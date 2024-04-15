// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:key_admin_panel/views/keys/key_page_ui.dart';


import '../users/user_page_ui.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePageUI>
    with SingleTickerProviderStateMixin {
  final colors = <Color>[Colors.indigo, Colors.blue, Colors.orange, Colors.red];

  double _size = 250.0;

  bool _large = true;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 0.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 200),
            width: _size,
            child: const LeftDrawer(),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.black87),
                        onPressed: () {
                          _updateSize();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Dashboard',
                          style: TextStyle(color: Colors.black87),
                        ),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.notification_important,
                            color: Colors.black87),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        icon: const Icon(Icons.power_settings_new,
                            color: Colors.black87),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
                Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      children: [
                        Text(
                          'Home >',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          _container(0, "Total users", "1000"),
                          _container(1, "Total Keys", "150"),
                          _container(2, "Total Plans/purchase details", "3"),
                        ],
                      ),
                      Container(
                        height: 400,
                        color: const Color(0xFFE7E7E7),
                        padding: const EdgeInsets.all(16),
                        child: Card(
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: const Text(
                              'Other details of the month',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _container(int index, String heading, String count) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xFFE7E7E7),
        child: Card(
          color: const Color(0xFFE7E7E7),
          child: Container(
            color: colors[index],
            width: 250,
            height: 140,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        count,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
                Text(heading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF01678F),
      child: ListView(
        children: [
          Container(
            width: 80,
            color: const Color(0xc503cccc),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/images.jpg", fit: BoxFit.cover),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            color: const Color(0xc503cccc),
            child: const Text(
              'Saloni shrivastava',
              style: TextStyle(fontSize: 22),
            ),
          ),
          _tile('Dashboard', context, () {
            print("Print1");
          }),
          _tile('Home', context, () {
            print("Home");
          }),
          _tile('Users', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserPage()),
            );
            print("Users");
          }),
          _tile('Keys', context, () {
            // Navigator.pushNamed(context, RouteGenerate.keyScreen);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const KeyPageUI()),
            );
            print("Keys");
          }),
          _tile('Plans', context, () {
            print("Plans");
          }),
          _tile('Profile', context, () {
            print("Profile");
          }),
          _tile('Logout', context, () {
            print("Logout");
          }),
        ],
      ),
    );
  }

  Widget _tile(String label, context, VoidCallback? callback) {
    return ListTile(
      title: Text(label),
      onTap: () {
        callback!();
      },
    );
  }
}
