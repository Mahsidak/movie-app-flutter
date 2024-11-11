import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends BaseView<MovieDetailsController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Movie details',
      isBackButtonEnabled: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 30.0,
            child: _buildAddToWatchListButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToWatchListButton() {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          _handleAddToFavourite();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appBarColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          "Add to Favourite",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void _handleAddToFavourite() async {
    // controller.addToFavourite(isFavourite: true);
    // Future.delayed(Duration(milliseconds: 1500), () {
    //   if (controller.addToFavSuccessOrNot) {
    //     _showSuccessDialog();
    //   }
    // });
    print('');
  }

  String _getUrlFromData(String posterPath) {
    return "https://image.tmdb.org/t/p/w500$posterPath";
  }
}