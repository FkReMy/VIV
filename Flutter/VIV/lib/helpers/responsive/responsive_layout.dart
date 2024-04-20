import 'package:flutter/material.dart';

// ResponsiveLayout is a widget that provides different layouts based on the screen width.
class ResponsiveLayout extends StatelessWidget {
  // Widgets for different screen sizes
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  // Constructor to initialize the ResponsiveLayout with the three different layouts.
  const ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder is used to determine the constraints of the parent widget.
    return LayoutBuilder(builder: (context, constraints) {
      // If the screen width is less than 600 pixels, use the mobile layout.
      if (constraints.maxWidth < 600) {
        return mobileScaffold;
      }
      // If the screen width is less than 1100 pixels, but greater than or equal to 600 pixels, use the tablet layout.
      else if (constraints.maxWidth < 1100) {
        return tabletScaffold;
      }
      // If the screen width is greater than or equal to 1100 pixels, use the desktop layout.
      else {
        return desktopScaffold;
      }
    });
  }
}
