import 'package:bloc/bloc.dart';
import 'package:hostbooks/Model/user_model.dart';
import 'package:hostbooks/Repository/git_user_repository.dart';
import 'package:meta/meta.dart';

import '../../Service/exceptions.dart';

part 'git_users_event.dart';
part 'git_users_state.dart';

class GitUsersBloc extends Bloc<GitUsersEvent, GitUsersState> {
  final GitInfoRepository _gitInfoRepository = GitInfoRepository();
  GitUsersBloc() : super(GitUsersInitial()) {
    on<LoadGitUsers>((event, emit) async {
      emit(GitUsersLoading());
      try {
        List<User> users = await _gitInfoRepository.fetchUsers(event.query);
        emit(GitUsersLoaded(users));
      } catch (error) {
        emit(error is AppException
            ? GitUsersError(error.toString())
            : GitUsersError('something went wrong'));
      }
    });
  }
}
