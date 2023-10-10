import 'package:blogapp/features/blogscreen/blogscreen.dart';
import 'package:blogapp/theme/custom_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("blog_bookmarked");
  runApp(const ProviderScope(child: MyApp()));
}

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
      baseUrl: "https://intent-kit-16.hasura.app/api/rest/blogs/",
      headers: {
        'x-hasura-admin-secret':
            '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6'
      }));
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Blog Explorer",
      theme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const BlogScreen(),
    );
  }
}
