import '/app/core/values/app_values.dart';

class MovieBookmarkRequest {
  String mediaId;
  String mediaType;
  bool favorite;

  MovieBookmarkRequest({
    this.mediaId = '',
    this.mediaType = "movie",
    this.favorite = false
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['media_id'] = mediaId;
    data['media_type'] = mediaType;
    data['favorite'] = favorite;

    return data;
  }
}