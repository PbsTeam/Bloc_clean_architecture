import 'package:bloc_clean_architecture/domain/entities/user/user_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../../service_locator.dart';
import '../datasources/remote/login_remote_datasource.dart';

class LoginRepositoryImpl extends LoginRepository {
  final remote = getIt.get<LoginRemoteDataSource>();

  @override
  Future<UserEntity> login(data) async {
    final response = await remote.userLogin(data: data);
    return UserEntity(token: response.token, error: response.error);
  }
}
