import 'package:equatable/equatable.dart';
import '../../../core/utils/enums/enums.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginFormState extends LoginState {
  final String? email;
  final String? pass;
  final String? error;
  final PostApiStatus? apiStatus;

  LoginFormState({
    this.email,
    this.pass,
    this.error,
    this.apiStatus,
  });

  LoginFormState copyWith({
    String? email,
    String? pass,
    String? error,
    PostApiStatus? apiStatus,
  }) =>
      LoginFormState(
        apiStatus: apiStatus ?? this.apiStatus,
        email: email ?? this.email,
        error: error ?? this.error,
        pass: pass ?? this.pass,
      );

  @override
  List<Object?> get props => [
        email,
        pass,
        apiStatus,
        error,
      ];
}
