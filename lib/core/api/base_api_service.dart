
abstract class BaseApiServices {
  Future<dynamic> getApiService({required String  url});
  Future<dynamic> postApiService({required String url,required  Map data});
}
