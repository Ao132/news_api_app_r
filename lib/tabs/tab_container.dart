// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app_r/tabs/tab_item.dart';
import 'package:news_app_r/model/source_response.dart';
import 'package:news_app_r/news/news_container.dart';


class TabContainer extends StatefulWidget {
  List<Source> sourcesList;

  TabContainer({
    Key? key,
    required this.sourcesList,
  }) : super(key: key);

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              tabs: widget.sourcesList
                  .map((source) => tabItem(isSelected: selectedIndex == widget.sourcesList.indexOf(source), source: source))
                  .toList()),
                  Expanded(child: NewsContainer(source:widget.sourcesList[selectedIndex] ))
        ],
      ),
    );
  }
}
