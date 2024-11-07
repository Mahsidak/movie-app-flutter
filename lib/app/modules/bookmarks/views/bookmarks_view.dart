import 'package:flutter/material.dart';

import '/app/core/base/base_view.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/bookmarks/controllers/bookmarks_controller.dart';

class BookmarksView extends BaseView<BookmarksController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Bookmarks',
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'Bookmarks is working',
        style: titleStyle,
      ),
    );
  }
}
