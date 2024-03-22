import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_apicall/bloc/user_bloc.dart';
import 'package:flutter_bloc_apicall/bloc/user_event.dart';
import '../bloc/users_state.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.add(GetUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UsersScreen'),
      ),
      body: BlocProvider(
        create: (context) => _userBloc,
        child: BlocBuilder<UserBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UsersLoadedState) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: state.usersModel.length,
                  itemBuilder: (context, index) {
                    var data = state.usersModel[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name!,
                              style: const TextStyle(fontSize: 18)
                            ),
                            Text(
                              data.email!,
                              style: const TextStyle(fontSize: 16)
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is UsersErrorState) {
              return Center(
                child: Text(state.errorMessage)
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
