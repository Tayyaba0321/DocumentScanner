import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const DocumentScannerApp());
}

class DocumentScannerApp extends StatelessWidget {
  const DocumentScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DocuScan',
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}