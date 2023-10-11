// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app_r/app_theme.dart';

import 'package:news_app_r/model/category.dart';

class CategoryItemWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryItemWidget({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: category.bgColor,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 20)),
      ),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: 100,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.whiteColor),
          )
        ],
      ),
    );
  }
}
