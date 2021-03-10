class ApiResponse<T>{
  bool ok;
  String msg;
  T result;

  ApiResponse.ok(this.result){
    ok = true;
  }

  ApiResponse.error(String msg){
    ok = false;
    this.msg = msg;
  }
}