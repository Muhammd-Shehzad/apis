import 'package:apis/data/Response/status.dart';

class ApiRessponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiRessponse({this.data, this.status, this.message});

  //this is super method to assign data
  ApiRessponse.loading() : status = Status.LOADING;
  ApiRessponse.complete() : status = Status.COMPLETED;
  ApiRessponse.Error() : status = Status.ERROR;
  @override
  String toString() {
    return 'Status: $status \n Message: $message \n Data: $data';
  }
}
