class MyException implements Exception {
  String title;
  String body;

  MyException({required this.title, required this.body});

  String ToString() {
    return "$title : $body";
  }
}

//* Fetch Data exception for using to api and aother data not storage to app.
class FetchDataException extends MyException {
  FetchDataException({required String body})
      : super(title: 'Data Communication Error', body: body);
}

//* For internet off
class BadRequestException extends MyException {
  BadRequestException({required String body})
      : super(title: 'Invalid Request', body: body);
}

//* for Un Authorised Data key ke liye
class UnAuthorisedException extends MyException {
  UnAuthorisedException({required String body})
      : super(title: 'UnAuthorised Request', body: body);
}

//* For Invalid Input Error
class InvalidInputExpception extends MyException {
  InvalidInputExpception({required String body})
      : super(title: 'Invalid Input Error', body: body);
}
