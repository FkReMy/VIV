// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:viv/components/Common/Colors/Colors.dart';

// UpperHome Widget
class UpperHome extends StatefulWidget {
  const UpperHome({super.key});

  @override
  State<UpperHome> createState() => _UpperHomeState();
}

// State class for UpperHome Widget
class _UpperHomeState extends State<UpperHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            color: black,
            child: Column(
              children: [
                // Padding for the top image
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Image.asset(
                    'assets/images/vivbw.png',
                  ),
                ),

                // Padding for the first text block
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 32, left: 200),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Support your Business.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: oldgold,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w600,
                        fontSize: 0.17,
                      ),
                    ),
                  ),
                ),

                // Padding for the second text block
                Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 15, left: 200),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Wherever you go, go with all your heart.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: oldgold,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.normal,
                        fontSize: 0.115,
                      ),
                    ),
                  ),
                ),

                // Image for the wave
                Image.asset(
                  'assets/images/wavew.png',
                ),

                // Container for the organization description
                Container(
                  color: white,
                  child: Row(
                    children: [
                      // Expanded widget containing the organization description text
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
