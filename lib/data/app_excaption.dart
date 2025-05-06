class AppExcaption implements Exception {
  final _message;
  final _prefix;
  AppExcaption([this._message, this._prefix]);
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppExcaption {
  FetchDataException([String? message])
    : super(message, "Error During Communication: ");
}

class BadRequestException extends AppExcaption {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppExcaption {
  UnauthorisedException([String? message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppExcaption {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
