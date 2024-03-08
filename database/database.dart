import '../helpers/errors.dart';
import '../models/post.dart';
import '../models/user.dart';

class Database {
  List<User> _users = []; // ! LIST
  List<Post> _posts = []; // ! LIST

  Map<User, List<Post>> _data = {}; // ! MAP

  Set<String> _uniqueNames = {}; // ! SET

  static final Database DB = Database();

  Database();

  factory Database.cache() { // ! ФАБРИЧНЫЙ КОНСТРУКТОР
    return DB;
  }

  void addUser(User user) {
    this._users.add(user);
    this._data.addAll({user: []});
    this._uniqueNames.add(user.name);
  }

  void deleteUserById(int userId) {
    for(int index = 0; index < _users.length; index++) {
      if(_users[index].id == userId) {
        _data.remove(_users[index]);
        _users.removeAt(index);
        return;
      }
    }
    throw Errors.USER_NOT_FOUND_ERROR;
  }

  void addPost(Post post) {
    this._posts.add(post);
    _data.forEach((key, value) {
      if(key.id == post.userId) {
        value.add(post);
        return;
      }
    });
  }

  Post? getPostById({required int postId}) {
    for(int index = 0; index < _posts.length; index++) {
      if(_posts[index].id == postId) {
        return _posts[index];
      }
    }
    throw Errors.POST_NOT_FOUND_ERROR;
  }

  void deletePostById({required int postId, required User? creator}) {
    assert(creator != null); // ! ASSERT
    for(int index = 0; index < _posts.length; index++) {
      if(_posts[index].id == postId) {
        _data[creator]!.remove(_posts[index]);
        _posts.removeAt(index);
        return;
      }
    }
  }

  List<Post> get posts => this._posts; // ! ЛЯМБДА 
  List<User> get users => this._users; // ! ЛЯМБДА 
  Map<User, List<Post>> get data => this._data; // ! ЛЯМБДА 
  Set<String> get uniqueNames => this._uniqueNames; // ! ЛЯМБДА
}