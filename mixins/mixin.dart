import '../models/post.dart';
import '../models/user.dart';

mixin PrintPostData { // ! МИКСИН
  void printInfo(Post post) {
    print('ID: ${post.id}');
    print('TITLE: ${post.title}');
    print('BODY: ${post.body}');
    print('USER_ID: ${post.userId}');
  }
}

mixin PrintUserData { // ! МИКСИН
  void printInfo(User user) {
    print('ID: ${user.id}');
    print('EMAIL: ${user.email}');
    print('NICKNAME: ${user.name}');
    print('ROLE: ${user.role}');
  }
}
