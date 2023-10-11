// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app_r/api/api_manager.dart';
import 'package:news_app_r/app_theme.dart';
import 'package:news_app_r/tabs/tab_container.dart';
import 'package:news_app_r/model/category.dart';
import 'package:news_app_r/model/source_response.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = 'category-details';
  Category? category;

  CategoryDetails({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SourceResponse?>(
          future: ApiManager.getSources(category?.id ?? ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryLightColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  const Text('Something Went Wrong'),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(category?.id ?? '');
                      },
                      child: const Text('Try Again'))
                ],
              );
            } else if (snapshot.data?.status != 'ok') {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? ''),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(category?.id ?? '');
                      },
                      child: const Text('Try Again'))
                ],
              );
            }
            var sourceList = snapshot.data?.sources ?? [];
            return TabContainer(sourcesList: sourceList);
          }),
    );
  }
}
