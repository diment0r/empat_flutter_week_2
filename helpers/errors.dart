abstract interface class Errors {
  static const String USER_VALIDATION_ERROR = '[USER DATA VALIDATION ERROR]\nLen of nickname (>=2 && <=10)\nEmail must contnain @\n';
  static const String POST_VALIDATION_ERROR = '[POST DATA VALIDATION ERROR]\nLen of title (>= 5 && <= 20)\nLen of description (>= 5 && <= 100)\n';

  static const String NO_ACCESS_ERROR = '[ROLE ERROR]\nThis action can be provided by admin only\n';
  static const String ACCESS_ERROR = '[ACCESS ERROR]\nYou can delete or update only own posts\n';

  static const String USER_NOT_FOUND_ERROR = '[USER NOT FOUND ERROR]\nNo user with this id\n';
  static const String POST_NOT_FOUND_ERROR = '[POST NOT FOUND ERROR]\nNo post with this id\n';
}