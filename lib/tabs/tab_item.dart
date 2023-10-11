// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app_r/app_theme.dart';
import 'package:news_app_r/model/source_response.dart';


class tabItem extends StatelessWidget {
  bool isSelected;
  Source source;
  tabItem({
    Key? key,
    required this.isSelected,
    required this.source,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppTheme.primaryLightColor, width: 3),
          color: isSelected ? AppTheme.primaryLightColor : Colors.transparent),
      child: Text(source.name??'',style: TextStyle(
        fontSize: 18,
        color: isSelected?AppTheme.whiteColor:AppTheme.primaryLightColor
      ),),
    );
  }
}
