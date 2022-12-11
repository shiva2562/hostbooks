part of 'git_users_bloc.dart';

@immutable
abstract class GitUsersEvent {}

class LoadGitUsers extends GitUsersEvent {
  final String query;

  LoadGitUsers(this.query);
}
