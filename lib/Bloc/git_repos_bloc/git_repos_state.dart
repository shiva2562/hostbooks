part of 'git_repos_bloc.dart';

@immutable
abstract class GitReposState {}

class GitReposInitial extends GitReposState {}

class GitReposLoading extends GitReposState {}

class GitReposLoaded extends GitReposState {
  final List<Repo> gitRepos;

  GitReposLoaded(this.gitRepos);
}

class GitReposError extends GitReposState {
  final String error;

  GitReposError(this.error);
}
