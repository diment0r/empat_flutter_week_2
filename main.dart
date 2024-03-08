import 'controllers/postController.dart';
import 'controllers/userController.dart';
import 'models/user.dart';
import 'database/database.dart';

final Database DB = Database.cache();
User admin = User(
  email: 'dimentor@gmail.com',
  nickname: 'dimentor',
  role: 'admin',
);

Function addUser(Database db, User user) {
  // ! ЗАМЫКАНИЕ
  return (
      {required String email, required String nickname}) {
    return UserController.createUser(
      DB: db,
      creator: user,
      email: email,
      nickname: nickname,
    );
  };
}

Function deleteUser(Database db, User user) {
  // ! ЗАМЫКАНИЕ
  return ({required int userId}) {
    UserController.deleteUser(
      DB: db,
      creator: user,
      userId: userId,
    );
  };
}

Function createUserByAdmin = addUser(DB, admin);
Function deleteUserByAdmin = deleteUser(DB, admin);

void main() {
  DB.addUser(admin);

  User? user1 = createUserByAdmin(
    email: 'bob@.gmail',
    nickname: 'Bob',
  );
  User? user2 = createUserByAdmin(
    email: 'max@.gmail',
    nickname: 'Max',
  );

  print(DB.data); // * {Instance of 'User': [], Instance of 'User': [], Instance of 'User': []}

  User? user3 = createUserByAdmin( // ? [USER DATA VALIDATION ERROR] Len of nickname (>=2 && <=10) Email must contnain @
    email: 'Mark.gmail',
    nickname: 'Mark',
  );

  user3 ??= user1; // ! СИНТАКСИЧЕСКИЙ САХАР

  print(user3); // * Instance of 'User'

  PostController.createPost(
    DB: DB,
    creator: admin,
    title: 'title',
    body: 'post body',
  );
  PostController.createPost(
    DB: DB,
    creator: user1!,
    title: 'title1',
    body: 'post body',
  );
  PostController.createPost(
    DB: DB,
    creator: user2!,
    title: 'title2',
    body: 'post body',
  );

  print(DB.data); // * {Instance of 'User': [Instance of 'Post'], Instance of 'User': [Instance of 'Post'], Instance of 'User': [Instance of 'Post']}

  PostController.deletePost(DB: DB, creator: user1, postId: 1); // ? [ACCESS ERROR] You can delete or update only own posts

  PostController.deletePost(DB: DB, creator: user1, postId: 2); 

  print(DB.data); // * {Instance of 'User': [Instance of 'Post'], Instance of 'User': [], Instance of 'User': [Instance of 'Post']}

  deleteUserByAdmin(userId: 2);

  print(DB.data); // * {Instance of 'User': [Instance of 'Post'], Instance of 'User': [Instance of 'Post']}
}