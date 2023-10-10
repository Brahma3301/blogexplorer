import 'package:blogapp/core/widgets/listtile.dart';
import 'package:blogapp/features/blogscreen/blogscreen_controller.dart';
import 'package:blogapp/features/favourite_screen/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogScreen extends ConsumerWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blog Explorer',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavouriteScreen()));
              },
              child: Container(
                child: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: ref.watch(blogScreenControllerProvider).blogslist.when(
          data: (blogslist) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final blog = blogslist[index];
              return BlogTile(blog: blog);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 0,
              );
            },
            itemCount: blogslist.length);
      }, error: (e, s) {
        return const Text('ssomething went wrong');
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
