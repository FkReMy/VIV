// Importing the material package which contains Flutter's material design framework
import 'package:flutter/material.dart';

// Custom List Tile Widget
// ignore: must_be_immutable
class CListTile extends StatelessWidget {
  // Properties representing the icon, text, icon color, and onTap callback
  final IconData icon;      // Icon to be displayed on the left side of the list tile
  final String text;        // Text to be displayed as the title of the list tile
  final Color iconcolor;    // Color of the icon
  void Function()? onTap;   // Callback function to be executed when the list tile is tapped

  // Constructor for the CListTile widget
  CListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.iconcolor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // ListTile widget to create a standard row of information
    return ListTile(
      // Icon on the left side of the list tile with the specified color
      leading: Icon(icon, color: iconcolor),
      // Title of the list tile with specified text and font style
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: 'RobotoSlab',
        ),
      ),
      // Callback function to be executed when the list tile is tapped
      onTap: onTap,
    );
  }
}
