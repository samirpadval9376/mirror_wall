class AllUrl {
  final String name;
  late String? url;
  String _value = "";

  AllUrl({
    required this.name,
    this.url,
  });

  factory AllUrl.fromMap({required Map data}) {
    return AllUrl(
      name: data['name'],
      url: data['url'],
    );
  }
}
