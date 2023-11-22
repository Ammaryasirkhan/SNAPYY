// staff_members.dart
import 'package:flutter/material.dart';

class StaffMember {
  final String name;
  final String designation;
  final String expertise;

  StaffMember({
    required this.name,
    required this.designation,
    required this.expertise,
  });
}

class StaffMembersPage extends StatelessWidget {
  final List<StaffMember> staffMembers = [
    StaffMember(
      name: "John Doe",
      designation: "Hair Stylist",
      expertise: "Hair Cutting, Coloring",
    ),
    StaffMember(
      name: "Jane Smith",
      designation: "Nail Technician",
      expertise: "Manicures, Pedicures",
    ),
    StaffMember(
      name: "Michael Johnson",
      designation: "Makeup Artist",
      expertise: "Bridal Makeup, Special Effects",
    ),
    StaffMember(
      name: "Emily Davis",
      designation: "Spa Therapist",
      expertise: "Massages, Facials",
    ),
    StaffMember(
      name: "David Wilson",
      designation: "Barber",
      expertise: "Men's Haircuts, Shaving",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Members'),
      ),
      body: ListView.builder(
        itemCount: staffMembers.length,
        itemBuilder: (context, index) {
          final staffMember = staffMembers[index];
          return ListTile(
            title: Text(staffMember.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Designation: ${staffMember.designation}'),
                Text('Expertise: ${staffMember.expertise}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
