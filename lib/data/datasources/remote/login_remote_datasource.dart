import 'dart:developer';
import 'package:bloc_clean_architecture/data/models/user/user_modal.dart';
import '../../../core/api/network_service.dart';
import '../../../core/constants/api_constants.dart';
import '../../../service_locator.dart';

abstract class LoginRemoteDataSource {
  Future<UserModal> userLogin({required Map data});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final _networkServices = getIt.get<NetworkApiService>();

  @override
  Future<UserModal> userLogin({required Map data}) async {
    // final response = await _networkServices.postApiService(
    //   url: ApiConstants.loginUrl,
    //   data: data,
    // );

    await Future.delayed(Duration(seconds: 2));

    return UserModal.fromJson({'token': 'token'});
  }
}
