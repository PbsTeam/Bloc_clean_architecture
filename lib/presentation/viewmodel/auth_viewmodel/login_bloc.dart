import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture/core/utils/local_storage/local_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../config/components/debouncing.dart';
import '../../../core/utils/enums/enums.dart';
import '../../../data/models/user/user_modal.dart';
import '../../../domain/repositories/login_repository.dart';
import '../../../domain/usecases/login_usecases.dart';
import '../../../service_locator.dart';
import 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginFormState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginFormState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<SubmitButtonEvent>(_submitButton);
  }

  final loginRepository = getIt.get<LoginRepository>();
  final debouncer = Debouncer(milliseconds: 300);

  final formKey = GlobalKey<FormState>();
  _emailEvent(EmailEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(email: event.email));
  }

  _passwordEvent(PasswordEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(pass: event.password));
  }

  _submitButton(SubmitButtonEvent event, Emitter<LoginFormState> emit) async {
    emit(state.copyWith(apiStatus: PostApiStatus.loading));

    try {
      Map<String, String> data = {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka",
      };

      final userEntity = await loginUseCase(data: data);

      if ((userEntity.token ?? '').isNotEmpty) {
        emit(state.copyWith(apiStatus: PostApiStatus.sucess, error: null));

        await LocalStorage.instance.saveUserLogin('true');
        await LocalStorage.instance.saveToken(userEntity.token ?? '');
      } else {
        emit(
          state.copyWith(
            apiStatus: PostApiStatus.error,
            error: userEntity.error,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(apiStatus: PostApiStatus.error, error: error.toString()),
      );
    }
  }
}
