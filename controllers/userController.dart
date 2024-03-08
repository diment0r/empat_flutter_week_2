import '../database/database.dart';
import '../models/user.dart';
import '../helpers/errors.dart';
import '../middlewares/validation.dart';

final class UserController {
  static User? createUser({
    required Database DB,
    required User creator,
    required String email,
    required String nickname,
    String role = 'user', // ! ПАРАМЕТР ПО УМОЛЧАНИЮ
  }) {
    if (creator.role == 'admin') {
      if (Validation.userDataValidation(email: email, nickname: nickname)) {
        User user = User(email: email, nickname: nickname, role: role);
        DB.addUser(user);
        return user;
      }
      print(Errors.USER_VALIDATION_ERROR);
      return null;
    }
    print(Errors.NO_ACCESS_ERROR);
    return null;
  }

  static void deleteUser({
    required Database DB,
    required User creator,
    required int userId,
  }) {
    if (creator.role == 'admin') {
      try {
        DB.deleteUserById(userId);
      } catch (error) {
        print(error);
      }
      return;
    }
    print(Errors.NO_ACCESS_ERROR);
    return;
  }
}
