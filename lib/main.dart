import 'package:flutter/material.dart';

import 'view/email_list_screen.dart'; // Make sure this path matches where you saved the screen file.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmailListScreen(),
    );
  }
}
