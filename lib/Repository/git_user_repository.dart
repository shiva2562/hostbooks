import 'package:hostbooks/Model/repos_model.dart';
import 'package:hostbooks/Model/user_model.dart';

import '../Service/git_services.dart';

class GitInfoRepository {
  ApiHandler _helper = ApiHandler();

  Future<List<User>> fetchUsers(String query) async {
    final response =
        await _helper.get("search/users?q=$query&sort=repositories");
    var items = response["items"] as List;
    List<User> users = [];
    for (var element in items) {
      users.add(User.fromJson(element));
    }
    return users;
  }

  Future<List<Repo>> fetchRepos(String user) async {
    final response = await _helper.get("users/$user/repos");
    List<Repo> repos = [];
    for (var element in response) {
      repos.add(Repo.fromJson(element));
    }
    return repos;
  }
}

class ApiResponse<T> {
  Status status;
  T data;
  String message;

  ApiResponse.loading(this.message, this.data) : status = Status.LOADING;
  ApiResponse.completed(this.data, this.message) : status = Status.COMPLETED;
  ApiResponse.error(this.message, this.data) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
