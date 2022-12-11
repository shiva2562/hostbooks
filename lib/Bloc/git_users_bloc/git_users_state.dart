part of 'git_users_bloc.dart';

@immutable
abstract class GitUsersState {}

class GitUsersInitial extends GitUsersState {}

class GitUsersLoading extends GitUsersState {}

class GitUsersLoaded extends GitUsersState {
  final List<User> gitUsers;

  GitUsersLoaded(this.gitUsers);
}

class GitUsersError extends GitUsersState {
  final String error;

  GitUsersError(this.error);
}
