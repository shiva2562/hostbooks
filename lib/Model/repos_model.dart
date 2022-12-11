class Repo {
  final String _name;
  final String _description;
  final String _url;
  // final bool _isPrivate;
  Repo.fromJson(Map<String, dynamic> json)
      : _name = json["name"],
        _description = json["description"] ?? "",
        _url = json["html_url"];

  String get name => _name;
  String get description => _description;
  String get url => _url;
  // bool get isPrivate => _isPrivate;
}
