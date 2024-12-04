import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_template/app/data/model/movie_bookmark_response.dart';
import 'package:flutter_getx_template/app/data/model/movie_list_response.dart';
import 'package:flutter_getx_template/app/data/remote/api_service_logic.dart';

import '../../../data/model/movie_bookmark_request.dart';

class MovieDetailsViewModel {
  final MovieData movieDetails;
  final ValueNotifier<bool> addToFavResponse = ValueNotifier(false);

  MovieDetailsViewModel(this.movieDetails);

  void addToFavourite() async {
    try {
      MovieBookmarkRequest params = MovieBookmarkRequest();
      params.mediaId = movieDetails.id.toString();
      params.favorite = true;

      MovieBookmarkResponse response = await APIServiceLogic.sharedInstance.bookmarkMovie(params);

      _handleBookmarkResponseSuccess(response);
    } catch (error) {
      print("Failed to add to favourites: $error");
    }
  }

  void _handleBookmarkResponseSuccess(MovieBookmarkResponse response) {
    addToFavResponse.value = response.success;
  }
}
