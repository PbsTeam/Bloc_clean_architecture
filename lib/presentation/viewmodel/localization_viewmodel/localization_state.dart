import 'package:flutter/material.dart';

class LocalizationState {
  final Locale locale;

  LocalizationState({required this.locale});

  LocalizationState copyWith({Locale? locale}) {
    return LocalizationState(locale: locale ?? this.locale);
  }

  /// Convert state to JSON
  Map<String, dynamic> toMap() {
    return {
      'languageCode': locale.languageCode,
      'countryCode': locale.countryCode,
    };
  }

  /// Convert JSON to state
  factory LocalizationState.fromMap(Map<String, dynamic> map) {
    return LocalizationState(
      locale: Locale(
        map['languageCode'] ?? 'en',
        map['countryCode'],
      ),
    );
  }
}