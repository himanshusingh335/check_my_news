
class BaseResponseModel {
  int? statusCode;
  Map<String, dynamic>? data;
  BaseResponseModel({
    this.statusCode,
    this.data,
  });

  factory BaseResponseModel.fromJson(int _code, Map<String, dynamic> _data) {
    return BaseResponseModel(
      statusCode: _code,
      data: _data
    );
  }
}
