// Importing the material package which contains Flutter's material design framework
import 'package:flutter/material.dart';

// Custom AppBar Widget
class MxTAppbar extends StatelessWidget implements PreferredSizeWidget {
  // Properties to customize the appearance of the app bar
  final Color bColor;     // Background color of the app bar
  final Color tcolor;     // Text color of the app bar title
  final Color icolor;     // Icon color of the app bar
  final AppBar appBar;    // Original AppBar to obtain its preferred size

  // Constructor for the MxTAppbar widget
  const MxTAppbar({
    Key? key,
    required this.bColor,
    required this.appBar,
    required this.tcolor,
    required this.icolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppBar widget to create the application bar
    return AppBar(
      // Setting the icon color of the app bar
      iconTheme: IconThemeData(color: icolor),
      // Title widget with customized text style
      title: Text(
        'V I V',
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: tcolor,
          fontFamily: 'RobotoSlab',
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      ),
      // Background color of the app bar
      backgroundColor: bColor,
    );
  }

  // Overriding the preferredSize getter to return the preferred size of the original AppBar
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
