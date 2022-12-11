import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostbooks/Bloc/git_repos_bloc/git_repos_bloc.dart';

class GitReposPage extends StatefulWidget {
  final String user;
  const GitReposPage(this.user, {super.key});

  @override
  State<GitReposPage> createState() => _GitReposPageState();
}

class _GitReposPageState extends State<GitReposPage> {
  @override
  void initState() {
    BlocProvider.of<GitReposBloc>(context).add(LoadGitRepos(widget.user));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.user}'s Repos")),
      body: BlocBuilder<GitReposBloc, GitReposState>(
        builder: (context, state) {
          if (state is GitReposLoaded) {
            if (state.gitRepos.isEmpty) {
              return const Center(
                child: Text("No data available"),
              );
            } else {
              return ListView(
                children: state.gitRepos
                    .map((e) => ListTile(
                          title: Text(e.name),
                          subtitle: Text(e.description),
                          leading: CircleAvatar(
                            child: Text(e.name[0].toUpperCase()),
                          ),
                        ))
                    .toList(),
              );
            }
          }
          if (state is GitReposError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
