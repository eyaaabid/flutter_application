class Tag {
  final int id;
  final String title;
  final double rate;

  Tag({required this.id, required this.title, required this.rate});

  factory Tag.fromJson(Map<String, dynamic> data) => Tag(
      id: data['id'],
      title: data['attributes']['title'],
      rate: data['attributes']['rate'].toDouble());
}
