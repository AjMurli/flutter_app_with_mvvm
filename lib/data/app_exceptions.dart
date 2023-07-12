class AppException implements Exception{

  final _message;
  final _prefix;

  AppException([
    this._message,
    this._prefix
    ]);

    String toString(){
      return '$_prefix$_message';
    }
}

// Unable to Link between client & server
class FetchDataException extends AppException{

  FetchDataException([String? message]) : super(message, "Error During Communication");
}

// Url does not exist
class BadrequestException extends AppException{
  
  BadrequestException([String? message]) : super(message, 'Invalid Request');
}

// It check if User has access to use specific feature or not 
class UnauthorisedException extends AppException{

  UnauthorisedException([String? message]) : super(message, 'Unauthorised Request');
}


class InvalidInputException extends AppException{

  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}