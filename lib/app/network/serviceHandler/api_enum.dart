enum RequestMethod { GET, POST, PUT, DELETE }

extension RequestMethodExtension on RequestMethod {
  String get name {
    switch (this) {
      case RequestMethod.GET:
        return 'GET';
      case RequestMethod.POST:
        return 'POST';
      case RequestMethod.PUT:
        return 'PUT';
      case RequestMethod.DELETE:
        return 'DELETE';
    }
  }
}
class ResponseCode {
  static const String OPERATION_SUCCESSFUL = "S100000";
  static const String RECORD_NOT_FOUND = "E000101";
  static const String INVALID_REQUEST_DATA = "E000102";
  static const String SERVICE_UNAVAILABLE = "E000103";
  static const String UNIQUE_CONSTRAINT_VIOLATION = "E000104";
  static const String VERIFICATION_FAILED = "E000105";
  static const String REQUEST_PROCESSING_FAILED = "E000106";
  static const String INVALID_TRANSACTION_PIN = "E000107";
  static const String OTP_GENERATION_FAILED = "E000108";
  static const String INACTIVE_ENTITY = "E000109";
  static const String TFA_NOT_SUPPORTED = "E000110";
  static const String INTER_SERVICE_COMMUNICATION_ERROR = "E000111";
  static const String DB_OPERATION_FAILED = "E000010";
  static const String BAD_OTP_ATTEMPTS_EXCEEDED = "E000112";
  static const String WRONG_PASSWORD = "E000113";
  static const String ENTITY_ALREADY_EXIST = "E000114";
  static const String TEMPORARY_USER_LOCK = "E000115";
  static const String AUTHENTICATION_FAILED = "E000116";
  static const String UPDATE_REQUIRED = "E000117";
  static const String NULL_VALUE = "E000118";
  static const String INSUFFICIENT_BALANCE = "E000120";
  static const String INVALID_TRANSACTION_CATEGORY_CODE = "E000121";
  static const String COOL_DOWN_VALIDATION_FAILED = "E000122";
  static const String DAILY_TRANSACTION_AMOUNT_VALIDATION_FAILED = "E000123";
  static const String MONTHLY_TRANSACTION_AMOUNT_VALIDATION_FAILED = "E000124";
  static const String PER_TRANSACTION_MIN_LIMIT_VALIDATION_FAILED = "E000125";
  static const String PER_TRANSACTION_MAX_LIMIT_VALIDATION_FAILED = "E000126";
  static const String DAILY_TRANSACTION_COUNT_VALIDATION_FAILED = "E000127";
  static const String MONTHLY_TRANSACTION_COUNT_VALIDATION_FAILED = "E000128";
  static const String DEVICE_BLACKLIST = "E000160";
  static const String OTP_NOT_VERIFIED = "E000161";
  static const String ACCOUNT_NOT_FOUND_EXCEPTION = "E000200";
  static const String INVALID_NOTIFICATION_TYPE = "E000201";
  static const String INVALID_ENUM = "E200202";
  static const String FORGOT_PASSWORD_NOT_ALLOWED = "E000163";
  static const String PIN_CHANGE_EXCEPTION = "E000162";
  static const String INVALID_MOBILE_TOKEN = "ECUS404";
}

