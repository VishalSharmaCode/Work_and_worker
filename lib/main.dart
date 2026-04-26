import 'package:flutter/material.dart';
import 'Splash/splash.dart'; // Import the SplashScreen widget
import 'role_selection/role.dart'; // Import the RoleSelection widget
import 'worker/login.dart'; // Import Login Screen of Worker
import 'worker/Signup.dart'; // Import Login Screen of Worker
import 'practice_test/p_test.dart'; //Import test Screen of Worker
import 'worker/deshboard.dart'; //Import deshboard Screen of Worker
import 'work_provider/login_wp.dart'; //Import login Screen of work provider
import 'work_provider/signup_wp.dart'; // Import signup Screen of work provider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: SplashScreen(), //Test SplashScreen
      // home: RoleSelection(), // Test Roleselection Screen
      // home: LoginWorker(), // Test Worker's Login Screen
      // home: SignUp_Worker(), // Test worker's Signup Screen
      // home: Test_Text_Button(),
      // home: WorkerDashboard(),
      home: SignUp_Wp(),
    );
  }
}
