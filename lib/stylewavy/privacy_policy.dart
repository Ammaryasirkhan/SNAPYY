import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Privacy Policy'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy for StyleSavvy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Introduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'StyleSavvy is committed to protecting the privacy of its users. This Privacy Policy explains how we collect, use, and safeguard your personal information when you use our salon system.',
            ),
            SizedBox(height: 16),
            Text(
              'Information Collection and Use',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may collect personal information from you when you create an account, make appointments, or use our salon system. This information may include, but is not limited to, your name, contact details, gender, and preferences. We use this information to provide you with our services and improve your salon experience.',
            ),
            SizedBox(height: 16),
            Text(
              'Information Sharing and Disclosure',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may share your personal information with our salon staff and service providers to fulfill your appointments and provide you with our services. We do not sell, trade, or rent your personal information to third parties without your consent, except as required by law or to protect our legal rights.',
            ),
            SizedBox(height: 16),
            Text(
              'Data Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We take reasonable measures to protect your personal information from unauthorized access, loss, misuse, disclosure, or alteration. However, no data transmission or storage system can be guaranteed to be 100% secure, so we cannot guarantee the security of your information.',
            ),
            SizedBox(height: 16),
            Text(
              'Changes to this Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We reserve the right to update or modify this Privacy Policy at any time. Changes to the Privacy Policy will be effective when posted, and your continued use of our salon system after the changes have been posted will constitute your acceptance of such changes.',
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about our Privacy Policy, please contact us at najmasadia07@gmail.com.',
            ),
          ],
        ),
      ),
    );
  }
}
