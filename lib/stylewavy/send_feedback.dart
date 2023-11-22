import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _feedbackController = TextEditingController();
  CollectionReference _feedbacksRef =
      FirebaseFirestore.instance.collection('feedbacks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Page'),
        centerTitle: true,
        backgroundColor: Colors.cyan[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'What are your thoughts about us?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _feedbackController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here...',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 30),
                backgroundColor: Colors.cyan[800],
              ),
              onPressed: () {
                _submitFeedback();
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitFeedback() {
    String feedback = _feedbackController.text;
    if (feedback.isNotEmpty) {
      // Create a new document with an auto-generated ID in the "feedbacks" collection
      _feedbacksRef.add({
        'feedbackText': feedback,
        'timestamp': FieldValue.serverTimestamp(),
      }).then((value) {
        _showFeedbackSubmittedDialog();
        _feedbackController.clear();
      }).catchError((error) {
        print('Error submitting feedback: $error');
      });
    }
  }

  void _showFeedbackSubmittedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feedback Submitted'),
          content: Text('Thank you for your feedback!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
