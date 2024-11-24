import 'package:chopper/chopper.dart';
import 'package:forest_logger/forest_logger.dart';
import 'package:viragvarazs/src/models/blog/blog_model.dart';
import 'package:viragvarazs/src/services/blog/blog_service.dart';

class BlogRepository {
  static Future<List<BlogModel>> getAllPosts() async {
    List<BlogModel> blogs = [];

    Response response = await BlogService.create().getAllPosts();
    response.body["data"].forEach((element) {
      try {
        BlogModel competitionModel = BlogModel.fromJson(element);
        blogs.add(competitionModel);
      } catch (e) {
        Forest.critical("Error while parsing BlogModel:$e");
      }
    });
    return blogs;
  }
}
