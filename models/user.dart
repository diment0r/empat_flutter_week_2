import '../mixins/mixin.dart';

class User with PrintUserData {
  int _id;
  String _email;
  String _nickname;
  String _role;
  static int usersCounter = 0;

  User({ // ! КОНСТРУКТОР ИНИЦИАЛИЗАЦИИ
    required String email,
    required String nickname,
    required String role,
  })  : this._id = ++usersCounter,
        this._email = email,
        this._nickname = nickname,
        this._role = role;
  
  int get id => this._id;
  String get role => this._role; 
  String get name => this._nickname;
  String get email => this._email;
}
