import 'package:forest_logger/forest_logger.dart';
import 'package:viragvarazs/src/exceptions/exception_handler.dart';
import 'package:viragvarazs/src/models/blog/blog_model.dart';
import 'package:viragvarazs/src/repositories/blog_repository.dart';
import 'package:viragvarazs/src/resources/interfaces/loading_interface.dart';

class BlogProvider extends LoadingInterface {
  List<BlogModel> blogs = [];

  Future<Exception?> getAllPosts() async {
    try {
      isLoading = true;
      blogs = await BlogRepository.getAllPosts();
      isLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }
}
