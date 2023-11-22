import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:style_savy/Pages/homepage.dart';
import 'package:style_savy/Pages/login.dart';
import 'package:style_savy/api/firebase_api.dart';
import 'package:style_savy/firebase_options.dart';
import 'package:style_savy/forgettonpassword/resetform.dart';
import 'package:style_savy/services/signup.dart';
import 'package:style_savy/stylewavy/appointments.dart';
import 'package:style_savy/stylewavy/mainpage.dart';
import 'package:style_savy/stylewavy/notification_page.dart';
import 'package:style_savy/stylewavy/order.dart';

import 'Routes/routes.dart';
import 'adminpanel/appointment_admin.dart';
import 'stylewavy/dashboard.dart';
import 'stylewavy/getstarted.dart';
import 'stylewavy/privacy_policy.dart';
import 'stylewavy/send_feedback.dart';
import 'stylewavy/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FireBaseApi firebaseApi = FireBaseApi();
  await firebaseApi.initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SalonApp(),
        Myroutes.loginroute: (context) => LoginPage(),

        Myroutes.homepageroute: (context) => HomePage(),

        Myroutes.signroute: (context) => SignUpPage(),
        Myroutes.forgotroute: (context) => ResetPasswordScreen(),
        Myroutes.dashboardroute: (context) => DashboardPage(),

        Myroutes.servicesroute: (context) => ServicesPage(),
        Myroutes.notificationroute: (context) => NotificationPage(),
        Myroutes.privacypolicyroute: (context) => PrivacyPolicyPage(),
        Myroutes.sendfeedbackroute: (context) => FeedbackPage(),
        Myroutes.appointmentroute: (context) => Appointments(),
        Myroutes.mainpageroute: (context) => mainpage(),
        Myroutes.orderroute: (context) => Orderpage(),
// Myroutes.m: (context) => SettingsPage(),
      },
    );
  }
}
