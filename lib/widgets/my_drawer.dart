import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/cupertino/icons.dart';
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.red,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Rahul"),
                accountEmail: Text("rahuldeshwal2003@gmail.com"),
                currentAccountPicture: CircleAvatar(),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,
              color: Colors.white,
              ),
              title: Text("Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
              color: Colors.white,
              ),
              title: Text("Profile",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,
              color: Colors.white,
              ),
              title: Text("Email me",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
