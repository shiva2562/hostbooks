class User {
  final String _name;
  final String _url;
  final String _avatarUrl;
  final String _reposUrl;
  // List<Repo> _repos;
  // int _repoCount;
  User.fromJson(Map<String, dynamic> json)
      : _name = json["login"],
        _url = json["html_url"],
        _avatarUrl = json["avatar_url"],
        _reposUrl = json["repos_url"];

  String get name => _name;
  String get url => _url;
  String get avatarUrl => _avatarUrl;
  String get reposUrl => _reposUrl;
}
