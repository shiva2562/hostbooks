import 'package:bloc/bloc.dart';
import 'package:hostbooks/Model/repos_model.dart';
import 'package:meta/meta.dart';

import '../../Repository/git_user_repository.dart';
import '../../Service/exceptions.dart';

part 'git_repos_event.dart';
part 'git_repos_state.dart';

class GitReposBloc extends Bloc<GitReposEvent, GitReposState> {
  final GitInfoRepository _gitInfoRepository = GitInfoRepository();
  GitReposBloc() : super(GitReposInitial()) {
    on<LoadGitRepos>((event, emit) async {
      emit(GitReposLoading());
      try {
        List<Repo> repos = await _gitInfoRepository.fetchRepos(event.query);
        emit(GitReposLoaded(repos));
      } catch (error) {
        emit(error is AppException
            ? GitReposError(error.toString())
            : GitReposError('something went wrong'));
      }
    });
  }
}
