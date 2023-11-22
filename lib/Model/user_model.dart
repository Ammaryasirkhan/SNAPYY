import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String fcmToken; // Add the fcmToken field

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.fcmToken, // Add this to the constructor
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'fcmToken': fcmToken, // Include fcmToken in the JSON data
    };
  }

  static User fromSnap(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;

    return User(
      uid: data['uid'],
      username: data['username'],
      email: data['email'],
      fcmToken: data['fcmToken'], // Get the fcmToken from Firestore
    );
  }
}
