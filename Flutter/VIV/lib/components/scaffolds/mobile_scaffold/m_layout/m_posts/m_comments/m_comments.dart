 import 'package:flutter/material.dart';
 import 'package:viv/components/common/colors/colors.dart';

 class MComment extends StatelessWidget {
   final String text; // Comment text
   final String user; // User who posted the comment
   final String time; // Time when the comment was posted

   const MComment({Key? key, required this.text, required this.user, required this.time})
       : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Container(
       decoration: BoxDecoration(
         color: lightgray,
         borderRadius: BorderRadius.circular(5),
       ),
       margin: const EdgeInsets.only(bottom: 5),
       padding: const EdgeInsets.all(15),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           // Comment text
           Text(text),
           // User and time information
           Row(
             children: [
               Text(user),
               const Text(" . "), // Separator between user and time
               Text(time),
             ],
           ),
         ],
       ),
     );
   }
 }
