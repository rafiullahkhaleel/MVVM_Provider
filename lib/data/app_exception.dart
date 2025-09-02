class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions(this._message, this._prefix);
  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
    : super(message, 'Error During Communication');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
    : super(message, 'Unauthorised request');
}
