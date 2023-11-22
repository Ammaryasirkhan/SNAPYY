class Appointment {
  final String name;
  final String orderDescription;
  final String contact;
  final String salonName;
  final String userId;

  Appointment({
    required this.name,
    required this.orderDescription,
    required this.contact,
    required this.salonName,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'orderDescription': orderDescription,
      'contact': contact,
      'salonName': salonName,
      'userId': userId,
    };
  }
}
