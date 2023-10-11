import 'package:flutter/material.dart';
import 'package:news_app_r/home/home_drawer.dart';
import 'package:news_app_r/model/category.dart';
import 'package:news_app_r/category/category_widget.dart';
import 'package:news_app_r/category/category_details.dart';
import 'package:news_app_r/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(

            'News App',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        drawer: Drawer(
          child: HomeDrawer(
            onItemDrawerClicked: onItemDrawerClicked,
          ),
        ),
        body: selectedItemDrawer == HomeDrawer.settings
            ? const SettingsTab()
            : selectedCategory == null
                ? CategoryWidget(
                    onCategoryItemClicked: onCategoryItemClicked,
                  )
                : CategoryDetails(
                    category: selectedCategory,
                  ));
  }

  Category? selectedCategory = null;

  void onCategoryItemClicked(Category category) {
    selectedCategory = category;
    setState(() {});
  }

  int selectedItemDrawer = HomeDrawer.categories;
  onItemDrawerClicked(int newSelectedItemDrawer) {
    selectedItemDrawer = newSelectedItemDrawer;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
