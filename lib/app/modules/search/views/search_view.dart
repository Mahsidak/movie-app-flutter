import 'package:flutter/material.dart';

import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/bookmarks/controllers/bookmarks_controller.dart';
import '/app/core/base/base_view.dart';

class SearchView extends BaseView<BookmarksController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Search',
    );
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'hello world',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}