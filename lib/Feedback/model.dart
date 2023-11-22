class FeedbackModel {
  final String id;
  final String feedbackText;
  final String userId;
  final DateTime timestamp;

  FeedbackModel({
    required this.id,
    required this.feedbackText,
    required this.userId,
    required this.timestamp,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['id'],
      feedbackText: json['feedbackText'],
      userId: json['userId'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'feedbackText': feedbackText,
      'userId': userId,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

// Create a FeedbackModel instance
FeedbackModel feedback = FeedbackModel(
  id: '1',
  feedbackText: 'This is a great app!',
  userId: 'user123',
  timestamp: DateTime.now(),
);

// Convert the feedback to JSON
Map<String, dynamic> feedbackJson = feedback.toJson();

// Parse JSON data into a FeedbackModel instance
FeedbackModel parsedFeedback = FeedbackModel.fromJson(feedbackJson);
