import '../database/database.dart';
import '../helpers/errors.dart';
import '../middlewares/validation.dart';
import '../models/post.dart';
import '../models/user.dart';

class PostController {
  static Post? createPost({
    required Database DB,
    required User creator,
    required String title,
    required String body,
  }) {
    if (Validation.postDataValidation(title: title, body: body)) {
      Post post = Post(title: title, body: body, userId: creator.id);
      DB.addPost(post);
      return post;
    }
    print(Errors.POST_VALIDATION_ERROR);
    return null;
  }

  static void deletePost({
    required Database DB,
    required User creator,
    required int postId,
  }) {
    try {
      Post? post = DB.getPostById(postId: postId);
      if(creator.id == post!.userId || creator.role == 'admin') {
        DB.deletePostById(postId: postId, creator: creator);
        return;
      }
      print(Errors.ACCESS_ERROR);
      return;
    } catch(error) {
      print(error);
    }

  }
}
