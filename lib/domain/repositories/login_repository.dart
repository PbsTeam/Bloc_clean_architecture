import '../entities/user/user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> login(data);
}
