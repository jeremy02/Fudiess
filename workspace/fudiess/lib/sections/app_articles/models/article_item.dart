class ArticleItem {
  final int id;
  final String title, description, date,  imagePath;
  final bool isRead;

  ArticleItem({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.imagePath,
    required this.isRead,
  });
}