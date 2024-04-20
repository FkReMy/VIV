// Importing the material package which contains Flutter's material design framework
import 'package:flutter/material.dart';

// Importing colors from a custom colors file
import 'package:viv/components/common/colors/colors.dart';

// Custom TextBox Widget
class MxTTextBox extends StatelessWidget {
  // Properties representing the text content, section name, and callback function for onPressed
  final String text;
  final String sectionName;
  final void Function()? onPressed;

  // Constructor for the MxTTextBox widget
  const MxTTextBox({
    super.key,
    required this.text,
    required this.sectionName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Container widget to provide padding, margin, decoration, and a child column for the text box
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      padding: const EdgeInsets.only(
        left: 15,
        bottom: 15,
      ),
      // Column widget to arrange child widgets vertically
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row widget to arrange child widgets horizontally with space between them
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Section Name
              Text(
                sectionName,
                style: const TextStyle(color: darkgray),
              ),

              // Edit Button
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.edit_outlined,
                  color: black,
                ),
              )
            ],
          ),

          // Text Content
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w500, color: black),
          ),
        ],
      ),
    );
  }
}
