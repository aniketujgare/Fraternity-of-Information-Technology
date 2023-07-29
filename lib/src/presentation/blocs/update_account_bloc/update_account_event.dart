part of 'update_account_bloc.dart';

abstract class UpdateAccountEvent extends Equatable {
  const UpdateAccountEvent();

  @override
  List<Object> get props => [];
}

class FetchUserEvent extends UpdateAccountEvent {
  const FetchUserEvent();
  @override
  List<Object> get props => [];
}

class AddUserEvent extends UpdateAccountEvent {
  const AddUserEvent();
  @override
  List<Object> get props => [];
}

class UpdateUserEvent extends UpdateAccountEvent {
  final UserModel userModel;
  const UpdateUserEvent({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class DeleteUserEvent extends UpdateAccountEvent {
  const DeleteUserEvent();
  @override
  List<Object> get props => [];
}

class CheckUserExistsEvent extends UpdateAccountEvent {
  const CheckUserExistsEvent();
  @override
  List<Object> get props => [];
}

class PickImageEvent extends UpdateAccountEvent {
  const PickImageEvent();
  @override
  List<Object> get props => [];
}

class UploadImageEvent extends UpdateAccountEvent {
  final File imageFile;

  const UploadImageEvent({required this.imageFile});
  @override
  List<Object> get props => [imageFile];
}

class OnUpdateAccountErrorEvent extends UpdateAccountEvent {
  final String error;
  const OnUpdateAccountErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}
