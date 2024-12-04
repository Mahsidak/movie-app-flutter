import 'base_response.dart';

class BaseBooleanResponse extends BaseResponse {
  bool? data;

  BaseBooleanResponse({String? responseCode, String? responseMessage, this.data})
      : super(responseCode: responseCode, responseMessage: responseMessage);

  factory BaseBooleanResponse.fromJson(Map<String, dynamic> json) {
    return BaseBooleanResponse(
      responseCode: json['responseCode'] as String?,
      responseMessage: json['responseMessage'] as String?,
      data: json['data'] as bool?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final baseJson = super.toJson();
    baseJson['data'] = data;

    return baseJson;
  }
}