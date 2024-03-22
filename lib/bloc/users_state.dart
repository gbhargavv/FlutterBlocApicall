import 'package:equatable/equatable.dart';
import '../models/users_model.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  List<UsersModel> usersModel;

  UsersLoadedState(this.usersModel);

  @override
  List<Object> get props => [usersModel];
}

class UsersErrorState extends UsersState {
  String errorMessage;

  UsersErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}