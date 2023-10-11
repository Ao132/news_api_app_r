// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app_r/category/cat_item_widget.dart.dart';
import 'package:news_app_r/model/category.dart';

class CategoryWidget extends StatelessWidget {
  var categoryList = Category.getCategoryList();
  Function onCategoryItemClicked;
  CategoryWidget({
    Key? key,
    required this.onCategoryItemClicked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick Your Category Of Interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 18),
              itemBuilder: (context, index) => InkWell(
                  onTap: () => onCategoryItemClicked(categoryList[index]),
                  child: CategoryItemWidget(category: categoryList[index], index: index)),
              itemCount: 6,
            ),
          )
        ],
      ),
    );
  }
}
