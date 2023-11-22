class AppointmentModel {
  final String id;
  final String sender;
  final String description;
  final DateTime dateOfSubmission;

  AppointmentModel({
    required this.id,
    required this.sender,
    required this.description,
    required this.dateOfSubmission,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      sender: json['sender'],
      description: json['description'],
      dateOfSubmission: DateTime.parse(json['dateOfSubmission']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'description': description,
      'dateOfSubmission': dateOfSubmission.toIso8601String(),
    };
  }
}

// Create an AppointmentModel instance
AppointmentModel appointment = AppointmentModel(
  id: '1',
  sender: 'John Doe',
  description: 'Meeting at 2 PM',
  dateOfSubmission: DateTime.now(),
);

// Convert the appointment to JSON
Map<String, dynamic> appointmentJson = appointment.toJson();

// Parse JSON data into an AppointmentModel instance
AppointmentModel parsedAppointment = AppointmentModel.fromJson(appointmentJson);
