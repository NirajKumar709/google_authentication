import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_authentication/api_calling/response_in_ui.dart';
import 'package:google_authentication/pages/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: GetType());
  }
}
