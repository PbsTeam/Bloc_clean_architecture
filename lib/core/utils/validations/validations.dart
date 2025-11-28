
class Validations {
  static isValidEmail(String email) {
    RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    return emailRegex.hasMatch(email);
  }
}
