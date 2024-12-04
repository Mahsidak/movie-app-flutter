import 'base_response.dart';

class BaseStringResponse extends BaseResponse {
  String? data;

  BaseStringResponse({String? responseCode, String? responseMessage, this.data})
      : super(responseCode: responseCode, responseMessage: responseMessage);

  factory BaseStringResponse.fromJson(Map<String, dynamic> json) {
    return BaseStringResponse(
      responseCode: json['responseCode'] as String?,
      responseMessage: json['responseMessage'] as String?,
      data: json['data'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final baseJson = super.toJson();
    baseJson['data'] = data;

    return baseJson;
  }
}
