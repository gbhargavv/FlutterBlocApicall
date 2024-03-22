import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_apicall/bloc/user_event.dart';
import 'package:flutter_bloc_apicall/bloc/users_state.dart';
import '../repo/users_repo.dart';

class UserBloc extends Bloc<UsersEvent, UsersState> {
  UserBloc() : super(UsersLoadingState()) {
    on<UsersEvent>((event, emit) async {
      try {
        emit(UsersLoadingState());
        var data = await UsersRepo().getUsers();
        emit(UsersLoadedState(data));
      } catch (e) {
        emit(UsersErrorState(errorMessage: e.toString()));
      }
    });
  }
}
