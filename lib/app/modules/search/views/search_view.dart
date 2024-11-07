import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../home/widget/item_github_project.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/core/base/base_view.dart';
import '../controllers/search_controller.dart';

class SearchView extends BaseView<SearchPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Search',
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: Colors.black,
            onSubmitted: (value) {
              controller.searchMovies(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.black),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Expanded(
          child: Obx(() => ListView.builder(
            itemCount: controller.movieList.length,
            itemBuilder: (context, index) {
              final model = controller.movieList[index];

              return MovieCard(dataModel: model);
            },
          )),
        ),
      ],
    );
  }
}