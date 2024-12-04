class BaseResponse {
  String? responseCode;
  String? responseMessage;

  BaseResponse({this.responseCode, this.responseMessage});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      responseCode: json['responseCode'] as String?,
      responseMessage: json['responseMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'responseCode': responseCode,
      'responseMessage': responseMessage,
    };
  }
}