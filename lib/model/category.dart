import 'package:flutter/material.dart';
import 'package:news_app_r/app_theme.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color bgColor;
  Category({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.bgColor,
  });


  static List<Category> getCategoryList() {
    return [
      Category(id: 'sports', title: 'Sports', imagePath: 'assets/images/sports.png', bgColor: AppTheme.redColor),
      Category(id: 'technology', title: 'Technology', imagePath: 'assets/images/Politics.png', bgColor: AppTheme.darkBlueColor),
      Category(id: 'health', title: 'Health', imagePath: 'assets/images/health.png', bgColor: AppTheme.pinkColor),
      Category(id: 'business', title: 'Business', imagePath: 'assets/images/bussines.png', bgColor: AppTheme.brownColor),
      Category(id: 'entertainment', title: 'Entertainment', imagePath: 'assets/images/environment.png', bgColor: AppTheme.blueColor),
      Category(id: 'science', title: 'Science', imagePath: 'assets/images/science.png', bgColor: AppTheme.yellowColor),
      Category(id: 'general', title: 'General', imagePath: 'assets/images/science.png', bgColor: AppTheme.yellowColor),
    ];
  }
}
