// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeBack => 'Welcome back!';

  @override
  String get loginHere => 'Login Here';

  @override
  String get pleaseEnterEmail => 'Please enter email';

  @override
  String get pleaseEnterAValidEmail => 'Please enter a valid email';

  @override
  String get pleaseEnterPassword => 'Please enter password';

  @override
  String get login => 'Login';

  @override
  String get changeLanguage => 'Change Language';
}
