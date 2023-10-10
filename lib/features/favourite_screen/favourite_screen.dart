import 'package:blogapp/core/widgets/listtile.dart';
import 'package:blogapp/features/blogscreen/blogscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Saved Blogs',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ref.watch(blogScreenControllerProvider).savedblogs != null
            ? ListView.separated(
                itemBuilder: (context, index) {
                  final blog = ref
                      .watch(blogScreenControllerProvider)
                      .savedblogs![index];
                  return BlogTile(blog: blog);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 0,
                  );
                },
                itemCount:
                    ref.watch(blogScreenControllerProvider).savedblogs!.length)
            : const Center(
                child: Text(
                  'Empty',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ));
  }
}
