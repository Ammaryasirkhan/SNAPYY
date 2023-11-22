import 'package:cloud_firestore/cloud_firestore.dart';
import '../Feedback/appointemnt_model.dart';
import '../Feedback/model.dart';

Future<List<FeedbackModel>> getFeedbackData() async {
  List<FeedbackModel> feedbackList = [];

  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('feedback').get();

    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      FeedbackModel feedback = FeedbackModel.fromJson(data);
      feedbackList.add(feedback);
    }
  } catch (e) {
    print("Error fetching feedback data: $e");
  }

  return feedbackList;
}

Future<List<AppointmentModel>> getAppointmentData() async {
  List<AppointmentModel> appointmentList = [];

  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('appointments').get();

    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      // AppointmentModel appointment = AppointmentModel.fromJson(data);
      //appointmentList.add(appointment);
    }
  } catch (e) {
    print("Error fetching appointment data: $e");
  }

  return appointmentList;
}
