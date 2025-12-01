// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get welcomeBack => 'वापसी पर आपका स्वागत है!';

  @override
  String get loginHere => 'यहाँ लॉगिन करें';

  @override
  String get pleaseEnterEmail => 'कृपया ईमेल दर्ज करें';

  @override
  String get pleaseEnterAValidEmail => 'कृपया एक मान्य ईमेल दर्ज करें';

  @override
  String get pleaseEnterPassword => 'कृपया पासवर्ड दर्ज करें';

  @override
  String get login => 'लॉगिन';

  @override
  String get changeLanguage => 'भाषा बदलें';

  @override
  String get changeTheme => 'थीम बदलें';

  @override
  String get movies => 'फ़िल्में';

  @override
  String get logoutText => 'क्या आप वाकई लॉगआउट करना चाहते हैं?';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';
}
