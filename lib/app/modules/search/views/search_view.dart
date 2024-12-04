import 'package:flutter/material.dart';
import '../../home/widget/item_github_project.dart';
import '/app/core/widget/custom_app_bar.dart';

class SearchView extends StatelessWidget{

  String previousSearchedInput = '';

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Search',
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (text) {
              previousSearchedInput = text;
            },
            decoration: InputDecoration(
              labelText: 'Search...',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
