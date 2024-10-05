class AppExceptions implements Exception{
   String prefix;
   String? message;
   AppExceptions([this.message,this.prefix='']);
   @override
  String toString() {
    // TODO: implement toString
    return 'prefix:$prefix\nmessage:$message';
  }

}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, '\nNo Internet');
}

class TimeoutException extends AppExceptions {
  TimeoutException([String? message]) : super(message, '\nRequest Timed Out');
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, '\nServer Error');
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message]) : super(message, '\nUnauthorized');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, '\nInvalid URL');
}

class ForbiddenException extends AppExceptions {
  ForbiddenException([String? message]) : super(message, '\nForbidden');
}

class NotFoundException extends AppExceptions {
  NotFoundException([String? message]) : super(message, '\nNot Found');
}

class ServiceUnavailableException extends AppExceptions {
  ServiceUnavailableException([String? message])
      : super(message, '\nService Unavailable');
}
