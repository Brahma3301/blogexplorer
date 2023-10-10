import 'package:blogapp/features/blogscreen/blog/blog.dart';
import 'package:blogapp/features/blogscreen/blog_repository.dart';
import 'package:riverpod/riverpod.dart';

final blogServiceProvider = Provider<BlogService>((ref) {
  final blogRepository = ref.watch(blogRepositoryProvider);
  return SubspaceBLogService(blogRepository);
});

abstract class BlogService {
  Future<List<Blog>> getBlogsList();
}

class SubspaceBLogService implements BlogService {
  final BlogReposittory _blogReposittory;
  SubspaceBLogService(this._blogReposittory);

  @override
  Future<List<Blog>> getBlogsList() async {
    final blogEntities = await _blogReposittory.getBlogslist();
    final bloglist = blogEntities.map((e) => Blog.fromEntity(e)).toList();
    return bloglist;
  }
}
