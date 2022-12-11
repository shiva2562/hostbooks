import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostbooks/Bloc/git_users_bloc/git_users_bloc.dart';
import 'package:hostbooks/Util/constants.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class GitUserPage extends StatefulWidget {
  const GitUserPage({super.key});

  @override
  State<GitUserPage> createState() => _GitUserPageState();
}

class _GitUserPageState extends State<GitUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchBar(
          hint: 'Search for an user',
          debounceDelay: const Duration(seconds: 3),
          onQueryChanged: (query) {
            if (query.isNotEmpty) {
              BlocProvider.of<GitUsersBloc>(context).add(LoadGitUsers(query));
            }
          },
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          isScrollControlled: true,
          builder: ((context, transition) {
            return BlocBuilder<GitUsersBloc, GitUsersState>(
              builder: (context, state) {
                if (state is GitUsersLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is GitUsersLoaded) {
                  return ListView.builder(
                    itemCount: state.gitUsers.length,
                    itemBuilder: (context, index) {
                      final user = state.gitUsers[index];
                      return ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.url),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatarUrl),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, Constants.gitRepoScreen,
                                arguments: user.name);
                          });
                    },
                  );
                }
                if (state is GitUsersError) {
                  return Center(
                    child: Text(
                      state.error,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Container();
              },
            );
          })),
    );
  }
}
