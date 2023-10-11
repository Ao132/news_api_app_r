import 'package:flutter/material.dart';
import 'package:news_app_r/app_theme.dart';
import 'package:news_app_r/category/category_details.dart';
import 'package:news_app_r/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        CategoryDetails.routeName: (context) =>   CategoryDetails(),
      },
    );
  }
}
