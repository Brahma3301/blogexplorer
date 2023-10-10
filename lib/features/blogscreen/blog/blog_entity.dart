class BlogEntity {
  final String title;
  final String url;
  final String id;

  BlogEntity({required this.title, required this.url, required this.id});

  factory BlogEntity.fromMap(Map<String, dynamic> map) {
    return BlogEntity(
        title: map['title'], url: map['image_url'], id: map['id']);
  }
}
