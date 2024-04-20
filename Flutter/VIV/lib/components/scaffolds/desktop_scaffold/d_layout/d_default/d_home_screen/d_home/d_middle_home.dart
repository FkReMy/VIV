// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:viv/components/Common/Colors/Colors.dart';

// UpperMidHome Widget
class UpperMidHome extends StatefulWidget {
  const UpperMidHome({super.key});

  @override
  State<UpperMidHome> createState() => _UpperMidHomeState();
}

// State class for UpperMidHome Widget
class _UpperMidHomeState extends State<UpperMidHome> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Container(
            color: white,
            child: Row(
              children: [
                // Expanded widget containing the text describing the organization
                const Expanded(
                  child: Text(
                    '''We are a local organization that provides support and expertise within the Business support, to potential small businesses, existing businesses, and organizations that need support.''',

                    style: TextStyle(
                      color: black,
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                // Expanded widget to create space between text sections
                const Expanded(child: SizedBox()),

                // Expanded widget containing contact information and social media icons
                Expanded(
                  child: Column(
                    children: [
                      // Text displaying "Get in touch:"
                      const Text(
                        "Get in touch: ",
                        style: TextStyle(
                          color: black,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      // Text displaying "No location yet..."
                      const Text(
                        "No location yet... ",
                        style: TextStyle(
                          color: black,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      // Text displaying "Follow us:"
                      const Text(
                        "Follow us:",
                        style: TextStyle(
                          color: black,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      // Row containing the Facebook icon button
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.facebook_outlined),
                            color: black,
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
