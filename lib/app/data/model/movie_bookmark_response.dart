class MovieBookmarkResponse {
  final bool success;
  final int statusCode;
  final String statusMessage;

  MovieBookmarkResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory MovieBookmarkResponse.fromJson(Map<String, dynamic> json) {
    return MovieBookmarkResponse(
      success: json['success'],
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }
}