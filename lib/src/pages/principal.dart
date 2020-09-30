import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:chat_app/src/pages/settings/settings.dart';
import 'package:chat_app/src/pages/chat/chats.dart';
import 'package:chat_app/src/pages/home/home.dart';

class Principal extends StatefulWidget {

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildScreens() {
        return [
          Home(),
          Chats(),
          Settings()
        ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(Icons.home),
                title: ("Home"),
                activeColor: CupertinoColors.activeBlue,
                inactiveColor: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.chat),
                title: ("Chats"),
                activeColor: CupertinoColors.activeBlue,
                inactiveColor: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.settings),
                title: ("Settings"),
                activeColor: CupertinoColors.activeBlue,
                inactiveColor: CupertinoColors.systemGrey,
            ),
        ];
    }

    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style4, // Choose the nav bar style with this property.
    );
  }
}