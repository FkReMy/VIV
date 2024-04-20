import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/common/colors/colors.dart';

// DDrawer Widget for the drawer
class DDrawer extends StatelessWidget {
  final Color bColor; // Background color of the drawer

  // Constructor with required background color parameter
  const DDrawer({
    Key? key,
    required this.bColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bColor, // Set the background color of the drawer
      child: ListView(
        children: [
          // Column containing the elements of the drawer
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // Drawer header with the text 'Menu'
              const DrawerHeader(
                child: Text(
                  'Menu',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
              ),
              // ListTiles for various navigation options
              const ListTile(
                leading: Icon(Icons.home_outlined, color: white),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.search_outlined, color: white),
                title: Text(
                  "Search",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.design_services_outlined, color: white),
                title: Text(
                  "Services Provided",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.message_outlined, color: white),
                title: Text(
                  "Messages",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.notifications_outlined, color: white),
                title: Text(
                  "Notification",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.add_outlined, color: white),
                title: Text(
                  "Create",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.settings_outlined, color: white),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.account_circle_outlined, color: white),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
              ),
              // Logout ListTile with onTap event to sign out the user
              ListTile(
                leading: const Icon(Icons.logout_outlined, color: white),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
