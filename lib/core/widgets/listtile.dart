// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogapp/features/blogscreen/blogscreen_controller.dart';
import 'package:blogapp/theme/palette.dart';
import 'package:flutter/material.dart';

import 'package:blogapp/features/blogscreen/blog/blog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogTile extends ConsumerWidget {
  final Blog blog;
  const BlogTile({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          InkWell(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
              bottom: Radius.circular(8),
            ),
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                color: Palette.grey800,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                  bottom: Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      blog.image,
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      blog.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8, // Adjust the top position as needed
            right: 8, // Adjust the right position as needed
            child: InkWell(
              onTap: () async {
                if (blog.issaved == false) {
                  ref
                      .read(blogScreenControllerProvider.notifier)
                      .togglesaved(blog);

                  ref
                      .read(blogScreenControllerProvider.notifier)
                      .addblogtobookmark(blog);
                } else {
                  ref
                      .read(blogScreenControllerProvider.notifier)
                      .togglesaved(blog);

                  ref
                      .read(blogScreenControllerProvider.notifier)
                      .removeblogtobookmark(blog);
                }
              },
              child: Icon(
                Icons.favorite, // You can use your own heart icon here
                color: blog.issaved
                    ? Colors.red
                    : Colors.white, // Customize the color as needed
                size: 24, // Customize the size as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
