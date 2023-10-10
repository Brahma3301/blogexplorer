import 'package:blogapp/features/blogscreen/blog/blog_entity.dart';
import 'package:blogapp/main.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final blogRepositoryProvider = Provider<BlogReposittory>((ref) {
  final dio = ref.watch(dioProvider);
  return SubspaceBlogRepository(dio: dio);
});

abstract class BlogReposittory {
  Future<List<BlogEntity>> getBlogslist();
}

class SubspaceBlogRepository implements BlogReposittory {
  final Dio dio;

  SubspaceBlogRepository({required this.dio});
  @override
  Future<List<BlogEntity>> getBlogslist() async {
    final response = await dio.get('');
    final result = List<Map<String, dynamic>>.from(response.data['blogs']);
    final blogEntitieslist = result.map((e) => BlogEntity.fromMap(e)).toList();
    return blogEntitieslist;
  }
}
