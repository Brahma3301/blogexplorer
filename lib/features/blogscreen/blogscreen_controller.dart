import 'package:blogapp/features/blogscreen/blog/blog.dart';
import 'package:blogapp/features/blogscreen/blog_service.dart';
import 'package:blogapp/features/blogscreen/blogscreen_state.dart';
import 'package:blogapp/storage/base_local_storage_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogScreenControllerProvider =
    StateNotifierProvider.autoDispose<BlogScreenController, BlogScreenState>(
        (ref) {
  return BlogScreenController(
      BlogScreenState(
        blogslist: AsyncValue.data([]),
      ),
      ref.watch(blogServiceProvider),
      ref.watch(localstorageProvider));
});

class BlogScreenController extends StateNotifier<BlogScreenState> {
  final BlogService _blogService;
  final LocalStorageRepository _db;
  BlogScreenController(BlogScreenState state, this._blogService, this._db)
      : super(state) {
    loadblogslist();
    prepareData();
  }

  Future<void> loadblogslist() async {
    state = state.copywith(blogslist: AsyncValue.loading());
    final result = await _blogService.getBlogsList();
    state = state.copywith(blogslist: AsyncValue.data(result));
  }

  void prepareData() {
    if (_db.getSavedBlogList().isNotEmpty) {
      state = state.copywith(savedblogs: _db.getSavedBlogList());
    }
  }

  void togglesaved(Blog blog) {
    state = state.copywith(
      blogslist: AsyncValue.data([
        for (final oldblog in state.blogslist.asData!.value)
          if (oldblog == blog) oldblog.saved() else oldblog
      ]),
      savedblogs: [
        for (final oldblog in state.savedblogs ?? [])
          if (oldblog == blog) oldblog.saved() else oldblog
      ],
    );
  }

  void addblogtobookmark(Blog blog) {
    final currentbloglist = state.savedblogs ?? [];
    final bloglist = state.blogslist.asData!.value;
    for (final e in bloglist) {
      if (e == blog) {
        currentbloglist.add(e);
      }
    }

    state = state.copywith(savedblogs: currentbloglist);
    _db.saveData(state.savedblogs!);
  }

  void removeblogtobookmark(Blog blog) {
    final currentbloglist = state.savedblogs!;
    if (currentbloglist.contains(blog)) {
      currentbloglist.remove(blog);
      state = state.copywith(savedblogs: currentbloglist);
      _db.saveData(state.savedblogs!);
    }
  }
}
