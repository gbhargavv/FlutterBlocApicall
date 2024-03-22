import 'package:equatable/equatable.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUserList extends UsersEvent {}
