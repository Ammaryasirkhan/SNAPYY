import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../Model/appointmenr_model.dart';
import '../Model/user_model.dart' as model;

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String fcmToken, // Add fcmToken parameter
  }) async {
    String response = "Some error happened";
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      model.User user = model.User(
        uid: credential.user!.uid,
        email: email,
        username: username,
        fcmToken: fcmToken, // Include fcmToken when creating the User instance
      );

      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(user.toJson());
      response = "success";

      return response; // Successful registration, return null for no error.
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        return 'Invalid email format';
      } else {
        return 'An error occurred: $err';
      }
    } catch (err) {
      return 'An error occurred: $err';
    }
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String response = "Some error happened";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(credential.user!.uid);

        response = "success";
      } else {
        response = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found' || err.code == 'wrong-password') {
        response = 'Invalid email or password';
      } else if (err.code == 'invalid-email') {
        response = 'The email is badly formatted';
      }
    } catch (err) {
      response = err.toString();
    }
    return response;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> createAppointment(Appointment appointment) async {
    String response = 'Some error happened';
    try {
      CollectionReference appointmentsRef =
          _firestore.collection('appointments');

      appointmentsRef.add(appointment.toJson()).then((_) {
        response = 'Appointment made successfully!';
      }).catchError((error) {
        response = 'Error making appointment: $error';
      });
    } catch (error) {
      response = 'Error making appointment: $error';
    }
    return response;
  }
}
