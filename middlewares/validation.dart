final class Validation {
  static bool userDataValidation({
    required String email,
    required String nickname,
  }) {
    bool isNickname = nickname.length >= 2 && nickname.length <= 10; 
    bool isEmail = email.contains('@');
    return isNickname && isEmail;
  }

  static bool postDataValidation({
    required String title,
    required String body,
  }) {
    bool isTitle = title.length >= 5 && title.length <= 20 ? true : false; // ! ЛЯМБДА
    bool isDescription = body.length >= 5 && body.length <= 100; 
    return isTitle && isDescription;
  }
}
