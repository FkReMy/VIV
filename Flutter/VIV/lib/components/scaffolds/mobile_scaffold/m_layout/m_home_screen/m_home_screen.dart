import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/common/colors/colors.dart';
import 'package:viv/components/common/widgets/all/unsigned/c_text_field/c_text_field.dart';
import 'package:viv/components/scaffolds/mobile_scaffold/m_layout/m_posts/m_posts.dart';
import 'package:viv/helpers/date_format/date_format.dart';

class MHomeScreen extends StatefulWidget {
  const MHomeScreen({Key? key}) : super(key: key);

  @override
  State<MHomeScreen> createState() => _MHomeScreenState();
}

class _MHomeScreenState extends State<MHomeScreen> {
  // Get the current user from FirebaseAuth
  final currentUser = FirebaseAuth.instance.currentUser!;

  // TextEditingController for the text input field
  final textController = TextEditingController();

  // Function to post a message
  void postMessage() {
    // Check if the text input is not empty
    if (textController.text.isNotEmpty) {
      // Add a new post to the "posts" collection in Firestore
      FirebaseFirestore.instance.collection("posts").add({
        'userEmail': currentUser.email,
        'status': textController.text,
        'timeStamp': Timestamp.now(),
        'Likes': [], // Initialize the 'Likes' field as an empty list
      });

      // Clear the text field after posting the message
      textController.clear();
    }

    // Optional: Force the widget to rebuild
    setState(() {
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkgray,
      body: Center(
        child: Column(
          children: [
            // Expanded ListView to display posts
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("posts")
                    .orderBy(
                  "timeStamp",
                  descending: true,
                )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // Extract posts from the snapshot
                    final posts = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        // Display each post using the MPost widget
                        return MPost(
                          message: post['status'],
                          user: post['userEmail'],
                          time: formatDate(post['timeStamp']),
                          postID: post.id,
                          likes: List<String>.from(post['Likes'] ?? []),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else {
                    // Display a loading indicator while fetching data
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            // Input field for posting messages and a post button
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Expanded(
                    child: CTextField(
                      controller: textController,
                      hintText: 'What do you want to talk about?',
                      obscureText: false,
                    ),
                  ),
                  IconButton(
                    onPressed: postMessage,
                    icon: const Icon(Icons.arrow_circle_up_outlined),
                  ),
                ],
              ),
            ),
            // Display the email of the logged-in user
            Text("Logged in as: ${currentUser.email!}"),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
