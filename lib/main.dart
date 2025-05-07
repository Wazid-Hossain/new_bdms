import 'package:blood_donetion/pages/BloodTypeSelectionPage.dart';
import 'package:blood_donetion/colors/colors.dart';
import 'package:flutter/material.dart';
// New component file

void main() {
  runApp(const BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const BloodTypeSelectionPage(),
    );
  }
}
