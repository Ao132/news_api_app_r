import 'package:flutter/material.dart';
import 'package:news_app_r/app_theme.dart';
import 'package:news_app_r/news/news_item.dart';
import 'package:news_app_r/api/api_manager.dart';
import 'package:news_app_r/model/news_response.dart';
import 'package:news_app_r/model/source_response.dart';

class NewsContainer extends StatelessWidget {
  Source source;
  NewsContainer({
    Key? key,
    required this.source,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(source.id ?? ''),
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
                      ApiManager.getNewsBySourceId(source.id ?? '');
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
                      ApiManager.getNewsBySourceId(source.id ?? '');
                    },
                    child: const Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(itemBuilder: (context,index)=>NewsItem(news: newsList[index]),itemCount: newsList.length,);
        });
  }
}
