import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/budget_page.dart';
import 'pages/analysis_page.dart';

void main() {
  runApp(const LouBankApp());
}

class LouBankApp extends StatelessWidget {
  const LouBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LouBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4E157),
          surface: Color(0xFF242424),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/budget': (context) => const BudgetPage(),
        '/analysis': (context) => const AnalysisPage(),
      },
    );
  }
}
