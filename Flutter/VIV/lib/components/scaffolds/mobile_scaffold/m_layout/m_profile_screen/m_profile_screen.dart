// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_is_empty

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/common/colors/colors.dart';
import 'package:viv/components/common/widgets/all/signed/c_drawer/c_drawer.dart';
import 'package:viv/components/common/widgets/mobile_x_tablet/mxt_default/app_bar/mxt_appbar.dart';
import 'package:viv/components/common/widgets/mobile_x_tablet/mxt_signedin/textbox/mxt_text_box.dart';

class MProfileScreen extends StatefulWidget {
  const MProfileScreen({Key? key}) : super(key: key);

  @override
  State<MProfileScreen> createState() => _MProfileScreenState();
}

class _MProfileScreenState extends State<MProfileScreen> {
  // User
  final currentUser = FirebaseAuth.instance.currentUser!;
  // Collection reference for user data in Firestore
  final usersCollection = FirebaseFirestore.instance.collection("users");

  // Function to edit a user field in Firestore
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: black,
        title: Text(
          "Edit " + field,
          style: const TextStyle(color: white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: lightgray),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // Cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: white),
            ),
          ),
          // Save button
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: const Text(
              "Save",
              style: TextStyle(color: white),
            ),
          ),
        ],
      ),
    );

    // Update in Firestore if the new value is not empty
    if (newValue.trim().length > 0) {
      // Only update if there is something in the text field
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgray,
      appBar: MxTAppbar(
        bColor: black,
        tcolor: white,
        icolor: white,
        appBar: AppBar(),
      ),
      endDrawer: const CDrawer(
        icolor: black,
        text: "Menu",
        bColor: white,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: usersCollection.doc(currentUser.email).snapshots(),
        builder: (context, snapshot) {
          // Get user data from Firestore
          if (snapshot.hasData) {
            final userdata = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Profile Picture Icon
                const Icon(
                  Icons.person,
                  size: 72,
                ),
                // User Email
                Text(
                  currentUser.email!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: black),
                ),
                const SizedBox(
                  height: 50,
                ),
                // User Details
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "My Details",
                    style: TextStyle(color: black),
                  ),
                ),
                // User Name TextBox
                MxTTextBox(
                  text: userdata["username"],
                  sectionName: "UserName",
                  onPressed: () => editField('username'),
                ),
                // Bio TextBox
                MxTTextBox(
                  text: userdata["bio"],
                  sectionName: "Bio",
                  onPressed: () => editField('bio'),
                ),
                const SizedBox(
                  height: 50,
                ),
                // User Posts
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "My posts",
                    style: TextStyle(color: black),
                  ),

                ),

              ],
            );
          } else if (snapshot.hasError) {
            // Show error message if there's an error in the snapshot
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // Show a loading indicator while waiting for data
          return const Scaffold(
            backgroundColor: black,
            body: Center(
              child: CircularProgressIndicator(
                color: oldgold,
              ),
            ),
          );
        },
      ),
    );
  }
}
