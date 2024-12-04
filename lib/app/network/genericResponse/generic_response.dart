class GenericResponse<T> {
  List<T>? data;
  String? responseCode;
  String? responseMessage;

  GenericResponse({this.data, this.responseCode, this.responseMessage});

  factory GenericResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT,
      ) {
    List<T>? parsedData;

    try {
      // Attempt to decode as a list
      if (json['data'] != null && json['data'] is List) {
        parsedData =
            (json['data'] as List).map((item) => fromJsonT(item)).toList();
      } else if (json['data'] != null) {
        // Attempt to decode as a single object
        parsedData = [fromJsonT(json['data'])];
      }
    } catch (e) {
      // Handle parsing errors
      parsedData = null;
    }

    return GenericResponse<T>(
      data: parsedData,
      responseCode: json['responseCode'] as String?,
      responseMessage: json['responseMessage'] as String?,
    );
  }
}