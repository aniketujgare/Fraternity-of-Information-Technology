part of 'update_account_bloc.dart';

abstract class UpdateAccountState extends Equatable {
  final List<String> branhItems = const [
    'IT',
    'Computer',
    'Chemical',
    'Civil',
    'Electrical',
    'EXTC',
    'Mechanical',
  ];
  final List<String> yearItems = const [
    'First Year',
    'Second Year',
    'Third Year',
    'Final Year',
  ];
  const UpdateAccountState();

  @override
  List<Object> get props => [branhItems, yearItems];
}

class UpdateAccountInitial extends UpdateAccountState {}

class UpdateAccountLoading extends UpdateAccountState {}

class UpdatedSuccesFully extends UpdateAccountState {}

class UpdateAccountError extends UpdateAccountState {
  final String error;

  const UpdateAccountError({required this.error});
  @override
  List<Object> get props => [error];
}

class FetchUserState extends UpdateAccountState {
  final UserModel userModel;
  const FetchUserState({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class AddUserState extends UpdateAccountState {
  const AddUserState();

  @override
  List<Object> get props => [];
}

class UpdateUserState extends UpdateAccountState {
  const UpdateUserState();

  @override
  List<Object> get props => [];
}

class DeleteUserState extends UpdateAccountState {
  const DeleteUserState();

  @override
  List<Object> get props => [];
}

class PickImageLoadingState extends UpdateAccountState {}

class ImageUploadedState extends UpdateAccountState {
  final String? imageURL;
  const ImageUploadedState({required this.imageURL});
}
