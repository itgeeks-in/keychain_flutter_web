import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:key_admin_panel/views/home/homescreen.dart';
import 'package:key_admin_panel/views/keys/key_page_ui.dart';
import 'package:key_admin_panel/views/plan/plan_ui.dart';
import 'package:key_admin_panel/views/profile/profilePagea.dart';
import 'package:key_admin_panel/views/users/user_page_ui.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({Key? key}) : super(key: key);

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  bool isExpanded = true;
  int _selectedIndex = 0;

  // final List<Widget> _screens = [
  //   HomeScreen(),
  //   ReportsScreen(),
  //   // KeyPageUI(),
  //   ProfileScreen(),
  //   SettingsScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/img.jpg",
                  height: 62, width: 62, fit: BoxFit.cover),
            ),
            indicatorColor: Colors.white,
            extended: isExpanded,
            // useIndicator: true,
            // elevation: 50,

            // labelType: NavigationRailLabelType.all,
            backgroundColor: Color.fromARGB(255, 8, 185, 216),
            unselectedIconTheme: IconThemeData(color: Colors.white, opacity: 1),
            unselectedLabelTextStyle: TextStyle(
              color: Colors.white,
            ),
            selectedIconTheme: IconThemeData(
              color: Color.fromARGB(255, 8, 185, 216),
            ),
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                padding: EdgeInsets.only(top: 30),
                label: Text("Dashboard"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people_outline_sharp),
                label: Text("Users"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.vpn_key_outlined),
                label: Text("Keys"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.playlist_add_rounded),
                label: Text("Plans"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.palette_rounded),
                label: Text("Category "),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_rounded),
                label: Text("Profile"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.logout),
                label: Text("Logout"),
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  // color: Colors.white,
                  decoration:
                      BoxDecoration(color: Colors.white, boxShadow: const [
                    // BoxShadow(
                    //   color: Colors.white,
                    //   blurRadius: 4,
                    //   spreadRadius: 2,
                    //   // offset: Offset(0, 10),
                    // )
                  ]),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: Icon(Icons.menu),
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

                Expanded(child: buildPages()),
                // Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: SingleChildScrollView(
                //     child: _screens[_selectedIndex],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPages() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return const UserPage();
      case 2:
        return const KeyPageUI();
      case 5:
        return const ProfilePage();

      case 3:
        return const PlanPage();
      // return HomeScreen();
      case 4:
      // return const ProfilePage();
      case 6:
      // return HomeScreen();
      default:
        return Container(
          child: Text("This is Screen Not Present"),
        ); // or any other default widget you prefer
    }
  }
}
