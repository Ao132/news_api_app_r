import 'package:flutter/material.dart';
import 'package:news_app_r/app_theme.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.primaryLightColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'English',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.primaryLightColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: AppTheme.primaryLightColor,
                  )
                ],
              )),
        ],
      ),
    );
  }

}
