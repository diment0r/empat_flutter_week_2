import '../mixins/mixin.dart';

final class Post with PrintPostData {
  int _id;
  String _title;
  String _body;
  int _userId;
  static int postsCounter = 0;

  Post({ // ! КОНСТРУКТОР ИНИЦИАЛИЗАЦИИ
    required String title,
    required String body,
    required int userId,
  })  : this._id = ++postsCounter,
        this._title = title,
        this._body = body,
        this._userId = userId;
  
  int get id => this._id;
  int get userId => this._userId;
  String get title => this._title;
  String get body => this._body;
}