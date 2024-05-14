import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/dialogs.dart';
import 'package:key_admin_panel/views/category/category_page_ui.dart';
import 'package:key_admin_panel/views/home/home_page_ui.dart';
import 'package:key_admin_panel/views/keys/key_page_ui.dart';
import 'package:key_admin_panel/views/plan/plan_ui.dart';
import 'package:key_admin_panel/views/profile/profile_page_ui.dart';
import 'package:key_admin_panel/views/users/user_page_ui.dart';

import '../../utils/theme_text.dart';
import '../category/bloc/category_page_bloc.dart';
import '../keys/bloc/key_bloc.dart';
import '../users/bloc/user_bloc.dart';

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
            minExtendedWidth: MediaQuery.of(context).size.width/6,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/img.jpg",
                  height: 62, width: 62, fit: BoxFit.cover),
            ),
            indicatorColor: ColorConsts.backgroundColor,
            extended: isExpanded,
            backgroundColor: ColorConsts.primaryColor,
            unselectedIconTheme:
                IconThemeData(color: ColorConsts.whiteColor, opacity: 1),
            selectedLabelTextStyle:
                TextStyle(color: ColorConsts.whiteColor, fontSize: 16),
            unselectedLabelTextStyle:
                TextStyle(color: ColorConsts.whiteColor, fontSize: 13),
            selectedIconTheme: IconThemeData(
              color: ColorConsts.primaryColor,
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
              if (_selectedIndex == 6) {
                Dialogs().logoutPopup(context, "en");
              }
            },
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorConsts.backgroundColor,
                      boxShadow: const [
                        BoxShadow(
                          color: ColorConsts.backgroundColor,
                          blurRadius: 2,
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
                        icon: const Icon(
                          Icons.menu,
                          color: ColorConsts.primaryColor,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          _getLabelForIndex(_selectedIndex),
                          style: TextStyle(color: ColorConsts.primaryColor),
                        ),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.notification_important,
                            color: ColorConsts.primaryColor),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        icon: Icon(Icons.power_settings_new,
                            color: ColorConsts.primaryColor),
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
        return  HomePageUI();
      case 1:
        return BlocProvider(
        create: (context) {
    return UsersDataBloc();
    },child: UserPage());


      case 2:
        return BlocProvider(
            create: (context) {
              return KeyBloc();
            },child: KeyPageUI());

      case 4:
        return BlocProvider(
            create: (context) {
              return CategoryPageBloc();
            },child: CategoryPageUI());
      case 5:
        return ProfilePage();
      case 3:
        return  PlanPage();
      case 6:
        return  HomePageUI();
      default:
        return Container(
          child: Text("This is Screen Not Present",
              style: ThemeText.textMediumGrey),
        ); // or any other default widget you prefer
    }
  }
}
