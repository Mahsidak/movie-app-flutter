import '/app/core/values/app_values.dart';

class MovieBookmarkRequest {
  String mediaId;
  String mediaType;
  bool favorite;

  MovieBookmarkRequest({
    required this.mediaId,
    this.mediaType = "movie",
    required this.favorite
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['media_id'] = mediaId;
    data['media_type'] = mediaType;
    data['favorite'] = favorite;

    return data;
  }
}