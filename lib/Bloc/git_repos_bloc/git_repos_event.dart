part of 'git_repos_bloc.dart';

@immutable
abstract class GitReposEvent {}

class LoadGitRepos extends GitReposEvent {
  final String query;

  LoadGitRepos(this.query);
}
