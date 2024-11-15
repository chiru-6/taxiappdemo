import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiappdemo/controller/auth_controller.dart';
import 'package:taxiappdemo/views/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taxiappdemo/views/profile_settings.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    authController.decideRoute();
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      
    );
  }
}
