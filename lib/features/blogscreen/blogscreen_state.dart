import 'package:blogapp/features/blogscreen/blog/blog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogScreenState {
  final AsyncValue<List<Blog>> blogslist;
  List<Blog>? savedblogs;

  BlogScreenState({required this.blogslist, this.savedblogs});

  BlogScreenState copywith(
      {AsyncValue<List<Blog>>? blogslist, List<Blog>? savedblogs}) {
    return BlogScreenState(
        blogslist: blogslist ?? this.blogslist,
        savedblogs: savedblogs ?? this.savedblogs);
  }
}
