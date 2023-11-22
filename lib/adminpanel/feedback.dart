import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FeedbackListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Feedback List'),
      ),
      body: FeedbackList(),
    );
  }
}

class FeedbackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('feedbacks').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No feedback found.'),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final feedback = snapshot.data!.docs[index];
            final data = feedback.data() as Map<String, dynamic>;

            return FeedbackListItem(feedback: data);
          },
        );
      },
    );
  }
}

class FeedbackListItem extends StatelessWidget {
  final Map<String, dynamic> feedback;

  FeedbackListItem({required this.feedback});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(
        (feedback['timestamp'] as Timestamp).toDate()); // Format date and time

    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_forward_ios),
              Text(feedback['feedbackText']),
            ],
          ),
          Text(
            formattedDate,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
