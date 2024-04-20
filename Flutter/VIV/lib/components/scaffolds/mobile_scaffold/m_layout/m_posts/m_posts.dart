import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/common/colors/colors.dart';
import 'package:viv/components/common/widgets/all/signed/c_comment_button/c_comment_button.dart';
import 'package:viv/components/common/widgets/all/signed/c_like_button/c_like_button.dart';
import 'package:viv/components/scaffolds/mobile_scaffold/m_layout/m_posts/m_comments/m_comments.dart';
import 'package:viv/helpers/date_format/date_format.dart';

class MPost extends StatefulWidget {
  final String message;
  final String user;
  final String postID;
  final String time;
  final List<String> likes;

  const MPost({
    Key? key,
    required this.message,
    required this.user,
    required this.postID,
    required this.likes,
    required this.time,
  }) : super(key: key);

  @override
  State<MPost> createState() => _MPostState();
}

class _MPostState extends State<MPost> {
  // Current user
  final currentUser = FirebaseAuth.instance.currentUser!;

  // Flag to track whether the post is liked by the current user
  bool isLiked = false;

  // Controller for the comment text field
  final _commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  // Toggle like for the post
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    // Reference to the post in Firestore
    DocumentReference postRef =
    FirebaseFirestore.instance.collection("posts").doc(widget.postID);

    // Update Likes field in Firestore
    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  // Add a comment to the post
  void addComment(String commentText) {
    FirebaseFirestore.instance
        .collection("posts")
        .doc(widget.postID)
        .collection("Comments")
        .add({
      "CommentText": commentText,
      "CommentedBy": currentUser.email,
      "CommentTime": Timestamp.now(), // Remember to format this when displaying
    });
  }

  // Show a dialog box for adding a comment
  void showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Comment"),
        content: TextField(
          controller: _commentTextController,
          decoration: const InputDecoration(hintText: "Write a Comment..."),
        ),
        actions: [
          // Post button
          TextButton(
            onPressed: () {
              // Add comment
              addComment(_commentTextController.text);

              // Clear the controller
              _commentTextController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text("Post"),
          ),
          // Cancel button
          TextButton(
            onPressed: () {
              // Clear the controller
              _commentTextController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),

          // Post and user email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User
              Row(
                children: [
                  Text(
                    widget.user,
                    style: const TextStyle(color: darkgray),
                  ),
                  const Text(" . "),
                  Text(
                    widget.time,
                    style: const TextStyle(color: darkgray),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              // Post
              Text(
                widget.message,
                style: const TextStyle(color: black, fontSize: 20),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Like
              Column(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  // Like button
                  CLikeButton(
                    isLiked: isLiked,
                    onTap: toggleLike,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Like counter
                  Text(
                    widget.likes.length.toString(),
                    style: const TextStyle(color: darkgray),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              // Comment
              Column(
                children: [
                  // Comment button
                  CCommentButton(
                    onTap: showCommentDialog,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Comment counter
                  Text(
                    widget.likes.length.toString(),
                    style: const TextStyle(color: darkgray),
                  ),
                ],
              ),
            ],
          ),

           // Comment section
           StreamBuilder<QuerySnapshot>(
             stream: FirebaseFirestore.instance
                 .collection("posts")
                 .doc(widget.postID)
                 .collection("Comments")
                 .orderBy("CommentTime", descending: true)
                 .snapshots(),
             builder: (context, snapshot) {
               // Show loading circle if no data yet
               if (!snapshot.hasData) {
                 return const Scaffold(
                   backgroundColor: black,
                   body: Center(
                     child: CircularProgressIndicator(
                       color: oldgold,
                     ),
                   ),
                 );
               }
               return ListView(
                 shrinkWrap: true, // For nested list
                 physics: const NeverScrollableScrollPhysics(),
                 children: snapshot.data!.docs.map(
                   (doc) {
                     // Get the comment
                     final commentData = doc.data() as Map<String, dynamic>;

                     // Return the comment
                      return MComment(
                        text: commentData["CommentText"],
                        user: commentData["CommentedBy"],
                        time: formatDate(commentData["CommentTime"]),
                      );
                   },
                 ).toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
