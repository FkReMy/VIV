// Importing necessary packages and dependencies
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/common/widgets/all/signed/c_list_tile/c_list_tile.dart';
import 'package:viv/components/scaffolds/mobile_scaffold/m_layout/m_profile_screen/m_profile_screen.dart';
import 'package:viv/components/scaffolds/mobile_scaffold/mobile_scaffold.dart';

// Custom Drawer Widget
class CDrawer extends StatelessWidget {
  // Properties to customize the appearance of the drawer
  final Color bColor; // Background color of the drawer
  final Color icolor; // Icon color used in the drawer
  final String text;  // Text displayed in the drawer header

  // Constructor to initialize the properties
  const CDrawer({
    Key? key,
    required this.bColor,
    required this.icolor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bColor, // Setting the background color of the drawer
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),

                // Drawer header
                DrawerHeader(
                  child: Text(
                    text,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: icolor,
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ),

                // Home
                CListTile(
                  icon: Icons.home_outlined,
                  iconcolor: icolor,
                  text: "Home",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MobileScaffold()),
                    );
                  },
                ),

                // Search
                CListTile(
                  icon: Icons.search_outlined,
                  text: "Search",
                  iconcolor: icolor,
                  onTap: () {},
                ),

                // Services Provided
                CListTile(
                  icon: Icons.design_services_outlined,
                  text: "Services Provided",
                  iconcolor: icolor,
                  onTap: () {},
                ),

                // Messages
                CListTile(
                  icon: Icons.message_outlined,
                  text: "Messages",
                  iconcolor: icolor,
                  onTap: () {},
                ),

                // Notification
                CListTile(
                  icon: Icons.notifications_outlined,
                  text: "Notification",
                  iconcolor: icolor,
                  onTap: () {},
                ),

                // Create a post
                CListTile(
                  icon: Icons.add_outlined,
                  text: "Create",
                  iconcolor: icolor,
                  onTap: () {},
                ),

                // Settings
                CListTile(
                  icon: Icons.settings_outlined,
                  text: "Settings",
                  iconcolor: icolor,
                  onTap: () {},
                ),

                // Profile
                CListTile(
                  icon: Icons.account_circle_outlined,
                  text: "Profile",
                  iconcolor: icolor,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MProfileScreen()),
                    );
                  },
                ),
              ],
            ),

            // Logout
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: CListTile(
                icon: Icons.logout_outlined,
                text: "Logout",
                iconcolor: icolor,
                onTap: () {
                  Navigator.pop(context);

                  // Signing out the user using Firebase Auth
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
