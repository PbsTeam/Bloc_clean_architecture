import '../entities/user/user_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> call({required Map data}) async {
    return await repository.login(data);
  }
}
