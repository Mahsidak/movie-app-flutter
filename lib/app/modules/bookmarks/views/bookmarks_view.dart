import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../../../core/widget/paging_view.dart';
import '../../home/widget/item_github_project.dart';
import '../controllers/bookmarks_controller.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';

class BookmarksView extends BaseView<BookmarksController> {
  BookmarksView() {
    controller.getBookmarkedMovies();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Bookmarks',
      isBackButtonEnabled: false,
    );
  }

    @override
    Widget body(BuildContext context) {
      return PagingView(
        onRefresh: () async {
          controller.onRefreshPage();
        },
        onLoadNextPage: () {
          controller.onLoadNextPage();
        },
        child: Obx(
              () => controller.movieList.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No favorites added",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          )
              : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.padding * 1.5,
              vertical: AppValues.padding,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.65,
              ),
              itemCount: controller.movieList.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.center,
                  child: MovieCard(dataModel: controller.movieList[index]),
                );
              },
            ),
          ),
        ),
      );
    }
}