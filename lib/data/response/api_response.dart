import 'package:flutter_app_with_mvvm/data/response/status.dart';


// T = representing the type of data that the API response will contain.
class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR; //AppException class will call 

  @override
  String toString() {
    return "Status : $status \n Message: $message \n Data: $data";
  }
}
