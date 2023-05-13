class GenericResponse{
  bool? error;
  String? message;

  GenericResponse.fromJson(json){
    error = json["error"]??true;
    message = json["message"]??"";
  }

  GenericResponse.withError(msg){
    error = true;
    message = msg;
  }


}