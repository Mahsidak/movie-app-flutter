import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
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
      backgroundColor: AppColors.colorPrimary,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<MovieDetailsController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Poster
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${controller.movieDetails.backdropPath}',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Movie Title
                    Text(
                      controller.movieDetails.title ?? controller.movieDetails.name ?? '',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 8.0),

                    // Release Date
                    Text(
                      "Release Date: ${controller.movieDetails.releaseDate}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 8.0),

                    // Rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        SizedBox(width: 4.0),
                        Text(
                          "${controller.movieDetails.voteAverage}/10",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),

          // Add to Watch List Button
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 30.0,
            child: bookmarksButton(),
          ),
        ],
      ),
    );
  }

  Widget bookmarksButton() {
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
    controller.addToFavourite();
  }
}