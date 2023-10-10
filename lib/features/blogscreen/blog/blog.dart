// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogapp/features/blogscreen/blog/blog_entity.dart';

class Blog {
  final String image;
  final String title;
  final bool issaved;
  final String id;

  Blog(
      {required this.image,
      required this.title,
      this.issaved = false,
      required this.id});

  factory Blog.fromEntity(BlogEntity entity) {
    return Blog(
        image: entity.url, title: entity.title, issaved: false, id: entity.id);
  }
  Blog saved() {
    return Blog(image: image, title: title, issaved: !issaved, id: id);
  }

  @override
  String toString() => 'Blog(image: $image, title: $title)';

  @override
  bool operator ==(covariant Blog other) {
    if (identical(this, other)) return true;

    return other.image == image && other.title == title && other.id == id;
  }

  @override
  int get hashCode => image.hashCode ^ title.hashCode ^ id.hashCode;
}
