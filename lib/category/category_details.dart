import 'package:flutter/material.dart';
import 'package:news_app_r/app_theme.dart';
import 'package:news_app_r/api/api_manager.dart';
import 'package:news_app_r/model/source_response.dart';
import 'package:news_app_r/category/tab_container.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = 'category-details';

  const CategoryDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder<SourceResponse?>(
          future: ApiManager.getSources(),
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
                        ApiManager.getSources();
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
                        ApiManager.getSources();
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
