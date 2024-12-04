import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../viewModel/movie_details_view_model.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieDetailsViewModel viewModel;

  MovieDetailsView({required this.viewModel});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Movie Details',
      isBackButtonEnabled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie Poster
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${viewModel.movieDetails.backdropPath}',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),

                Text(
                  viewModel.movieDetails.title ?? viewModel.movieDetails.name ?? '',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),

                // Release Date
                Text(
                  "Release Date: ${viewModel.movieDetails.releaseDate}",
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
                      "${viewModel.movieDetails.voteAverage}/10",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Add to Watch List Button
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 30.0,
            child: bookmarksButton(context),
          ),
        ],
      ),
    );
  }

  Widget bookmarksButton(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: viewModel.addToFavResponse,
      builder: (context, isFavourite, _) {
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              _handleAddToFavourite(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appBarColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              isFavourite ? "Added to Favourite" : "Add to Favourite",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void _handleAddToFavourite(BuildContext context) {
    viewModel.addToFavourite();
    Future.delayed(Duration(milliseconds: 1500), () {
      if (viewModel.addToFavResponse.value) {
        _showSuccessDialog(context);
      }
    });
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text("Movie added to your favourites!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}