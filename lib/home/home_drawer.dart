// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app_r/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const categories=1;
  static const settings=2;
  Function onItemDrawerClicked;
   HomeDrawer({
    Key? key,
    required this.onItemDrawerClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: height * .1),
          color: AppTheme.primaryLightColor,
          width: double.infinity,
          child: Text(
            'News App!',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => onItemDrawerClicked(categories),
            child: Row(
              children: [
                const Icon(Icons.list, size: 30),
                const SizedBox(width: 5),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => onItemDrawerClicked(settings),
            child: Row(
              children: [
                const Icon(Icons.settings, size: 30),
                const SizedBox(width: 5),
                Text('Settings', style: Theme.of(context).textTheme.titleSmall)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
