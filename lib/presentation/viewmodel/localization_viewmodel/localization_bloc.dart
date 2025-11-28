import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'localization_event.dart';
import 'localization_state.dart';

class LocalizationBloc
    extends HydratedBloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState(locale: const Locale('en'))) {
    on<ChangeLanguageEvent>((event, emit) {
      emit(state.copyWith(locale: event.locale));
    });
  }
  @override
  LocalizationState? fromJson(Map<String, dynamic> json) {
    try {
      return LocalizationState.fromMap(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(LocalizationState state) {
    try {
      return state.toMap();
    } catch (_) {
      return null;
    }
  }
}
