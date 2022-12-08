import 'package:feedtheneed/api/blog_api.dart';
import 'package:feedtheneed/model/blog.dart';

class BlogRepository {
  Future<List<dynamic>> getBlogs() async {
    return BlogAPI().getBlogs();
  }

  Future<Blog?> getSingleBlogs(String blogid) async {
    return BlogAPI().getSingleBlogs(blogid);
  }
}
