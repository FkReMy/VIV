// Return a formatted date as a string
// The function takes a Timestamp object as input and converts it into a formatted string
// representing the date.

import 'package:cloud_firestore/cloud_firestore.dart';

String formatDate(Timestamp timestamp) {
  // Timestamp is the object we retrieve from Firebase

  // Convert the Timestamp to a DateTime object
  DateTime dateTime = timestamp.toDate();

  // Get the year as a string
  String year = dateTime.year.toString();

  // Get the month as a string
  String month = dateTime.month.toString();

  // Get the day as a string
  String day = dateTime.day.toString();

  // Final formatted date in the format: "day/month/year"
  String formattedDate = "$day/$month/$year";

  return formattedDate;
}
