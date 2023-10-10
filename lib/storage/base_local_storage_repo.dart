import 'package:blogapp/features/blogscreen/blog/blog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final localstorageProvider = Provider((ref) {
  return LocalStorageRepository();
});

class LocalStorageRepository {
  final _mybox = Hive.box("blog_bookmarked");

  void saveData(List<Blog> savedblog) async {
    List<List> allsavedblogformatted = [];
    for (var blog in savedblog) {
      List savedblogformatted = [blog.id, blog.image, blog.title, blog.issaved];
      allsavedblogformatted.add(savedblogformatted);
    }
    _mybox.put("all_blog", allsavedblogformatted);
  }

  List<Blog> getSavedBlogList() {
    List savedblogs = _mybox.get("all_blog") ?? [];
    List<Blog> allblogs = [];
    for (int i = 0; i < savedblogs.length; i++) {
      String id = savedblogs[i][0];
      String image = savedblogs[i][1];
      String title = savedblogs[i][2];
      bool issaved = savedblogs[i][3];

      Blog blog = Blog(image: image, title: title, id: id, issaved: issaved);
      allblogs.add(blog);
    }
    return allblogs;
  }

  Future<void> addBlogToSavelist(Box box, Blog blog) async {
    await box.put(blog.id, blog);
  }

  Future<void> removeBlogFromSavelist(Box box, Blog blog) async {
    await box.delete(blog.id);
  }
}
