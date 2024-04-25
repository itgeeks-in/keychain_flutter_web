import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:key_admin_panel/utils/dialogs.dart';
import 'package:key_admin_panel/views/home/home_screen.dart';
import 'package:key_admin_panel/views/keys/key_page_ui.dart';
import 'package:key_admin_panel/views/plan/plan_ui.dart';
import 'package:key_admin_panel/views/profile/profile_page_ui.dart';
import 'package:key_admin_panel/views/users/user_page_ui.dart';

import '../../utils/theme_text.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<SideDrawer> {
  bool isExpanded = true;
  int _selectedIndex = 0;

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
                label: Text("Category"),
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
              print("??????");

                setState(() {
                  _selectedIndex = index;
                });
              if(_selectedIndex==6){
                Dialogs().logoutPopup(context, "en");
              }

            },
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: Colors.white, boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 4,
                      spreadRadius: 2,
                    )
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
                        child: Text(
                          _getLabelForIndex(_selectedIndex),
                          style: TextStyle(color: Colors.black87),
                        ),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.notification_important,
                            color: Colors.black87),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        icon: Icon(Icons.power_settings_new,
                            color: Colors.black87),
                        onPressed: () {
                          Dialogs().logoutPopup(context, "en");

                        },
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
//ToDo:

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Users';
      case 2:
        return 'Keys';
      case 3:
        return 'Plans';
      case 4:
        return 'Category';
      case 5:
        return 'Profile';

      default:
        return '';
    }
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
      case 6:
        return HomeScreen();
      default:

        return Container(
          child: Text("This is Screen Not Present",style: ThemeText.textMediumGrey),
        ); // or any other default widget you prefer
    }
  }
}
